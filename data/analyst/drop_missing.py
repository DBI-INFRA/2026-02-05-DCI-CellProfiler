#!/usr/bin/env python3
import argparse
import sqlite3

def main():
    ap = argparse.ArgumentParser(description="Drop rows with missing (NULL) values from a table in an SQLite DB.")
    ap.add_argument("db_path", help="Path to the SQLite database file (.db/.sqlite)")
    ap.add_argument("--table", default="MyExpt_Per_object", help="Table name (default: MyExpt_Per_object)")
    args = ap.parse_args()

    conn = sqlite3.connect(args.db_path)
    try:
        conn.execute("PRAGMA foreign_keys = ON;")

        # Get column names from schema
        cols = [row[1] for row in conn.execute(f'PRAGMA table_info("{args.table}")')]
        if not cols:
            raise SystemExit(f'Table "{args.table}" not found (or has no columns).')

        # Build a predicate that matches any NULL in any column
        where_null_any = " OR ".join([f'"{c}" IS NULL' for c in cols])

        with conn:  # transactional
            conn.execute(f'DELETE FROM "{args.table}" WHERE {where_null_any};')

        # Optional: reclaim space after large deletes (can be slow); uncomment if you want it
        # conn.execute("VACUUM;")

        print(f'Cleaned table "{args.table}" in {args.db_path}')
    finally:
        conn.close()

if __name__ == "__main__":
    main()

