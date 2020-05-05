Build beautiful, customized graphs and charts in R with ggplot2 (setup &
layout)
================
Martin Frigaard

  - [Preferred setup](#preferred-setup)
      - [Options for setting up `ggplot2` in
        Katacoda](#options-for-setting-up-ggplot2-in-katacoda)
          - [The `Terminal`](#the-terminal)
          - [The `2x Terminal Split`](#the-2x-terminal-split)
          - [The `Editor + Terminal`](#the-editor-terminal)
          - [The `Terminal + Editor`](#the-terminal-editor)
          - [The `Terminal + Iframe` (application inside the
            dashboard).](#the-terminal-iframe-application-inside-the-dashboard.)

# Preferred setup

The layout for this scenario should be able to render the `ggplot2`
image in a window adjacent to the console/terminal.

In RStudio, this looks like this:

<img src="figs/rstudio-cloud-ggplot2.png" width="1626" />

In datacamp, it looks like this:

<img src="figs/datacamp-ggplot2.png" width="1838" />

## Options for setting up `ggplot2` in Katacoda

The options for layouts katacoda are available
[here](https://katacoda.com/docs/scenarios/layouts) and include the
following:

### The `Terminal`

Use command `terminal`

### The `2x Terminal Split`

Use command `terminal-terminal`

### The `Editor + Terminal`

Use command `editor-terminal`

### The `Terminal + Editor`

for the embedded presentation `editor-terminal-split` Make sure to
include `data-katacoda-layout="editor-terminal-split"` in the `html` for
the embedded code.

### The `Terminal + Iframe` (application inside the dashboard).

Requires `backend.port` within `index.json`

Use command `terminal-iframe`
