---
title: 'Introduction to the BBBC021 dataset'
teaching: 10
exercises: 0
editor_options: 
  markdown: 
    wrap: 72
---

::: questions
-   What is the BBBC021 dataset?
:::

::: objectives
-   Get an overview of the research question behind BBBC021.
-   Understand the file structure.
:::

## The example dataset BBBC021

Welcome! For the next exercise we will use a compact,
[well-studied](https://doi.org/10.1158/1535-7163.MCT-09-1148) image set
pulled from the [Broad Bioimage Benchmark
Collection](https://bbbc.broadinstitute.org/) (BBBC). The collection we
are using is BBBC021, which contains images of MCF7 breast cancer cells
treated with a panel of compounds. You can browse the full dataset here:
<https://bbbc.broadinstitute.org/BBBC021>.

Why this dataset? Firstly, it is real experimental data used to discover
which compounds change cell morphology and to cluster compounds by the
pathways they perturb. Secondly, it is small and clean enough for
hands-on learning, but biologically rich, so the analyses you build here
translate to real research problems.

What did the experiment involve?

-   Cells: MCF7 (human breast cancer cell line)
-   Perturbations: 112 small molecules + DMSO control at multiple
    concentrations (we will use just two wells for the workshop)
-   Stains (channels):
    -   DAPI: stains DNA / nuclei (channel1)
    -   Phalloidin: stains f‑actin (channel2)
    -   Anti‑β‑tubulin antibody: stains microtubules (channel3)

A small fun fact: the DAPI + phalloidin pair used here are part of the
core staining strategy still employed in modern Cell Painting protocols.

In this workshop, we will focus on comparing cells treated with DMSO to
those treated with **cytochalasin D** (cytoD). It is a classic
actin‑disrupting drug. When actin polymerization is disrupted you often
see cells lose their spread morphology, change shape, and show altered
phalloidin signal. That makes this a great case study for image‑based
phenotyping.

:::: challenge
Given what you know about the dataset so far, can you formulate a
research question? Try thinking about questions we may be able to answer
using the images.

::: solution
One option is: does cytochalasin D induce a morphological change in MCF7
cells?

But note that other questions may be interesting too! For example: does
cytoD induce cell death?
:::
::::

### Files and Metadata

Filenames contain the experimental metadata so you do not need a
separate spreadsheet. For example, the file name
`cytoD_B07_s1_channel1.tif` can be read as

-   Treatment: cytoD
-   Well: B07
-   Site: s1 (image field within the well)
-   Channel: channel1 (DAPI in this dataset)

### Downloading sample data
If you have not yet done so, you will need to download the dataset now.
Click on the button below and unzip the archive to a convenient location
on your computer.
<a href="data/BBBC021_data.zip" download class="btn btn-primary" style="display:inline-block;padding:8px 12px;background:#007bff;color:#fff;border-radius:4px;text-decoration:none;">Download dataset</a>


Ready to build the pipeline? Proceed to the next section to open these
images in CellProfiler and start measuring the features that will answer
our question.

::: keypoints
-   BBBC021 is a high-content imaging dataset of MCF7 cells.
-   File names contain information about treatments and experimental
    parameters.
:::
