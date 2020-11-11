Combine narrative with numbers for effective storytelling in R
================
Martin Frigaard

  - [setup](#setup)
  - [Outline](#outline)
      - [Objectives](#objectives)
      - [The learners](#the-learners)
      - [intro](#intro)
          - [Welcome\!](#welcome)
          - [What makes a great graphic?](#what-makes-a-great-graphic)
          - [What makes a bad graphic?](#what-makes-a-bad-graphic)
      - [step 1](#step-1)
          - [Who is our audience?](#who-is-our-audience)
          - [Who are the stakeholders?](#who-are-the-stakeholders)
      - [step 2](#step-2)
          - [Data quality: what are we looking
            at?](#data-quality-what-are-we-looking-at)
              - [Are we seeing what we
                expected?](#are-we-seeing-what-we-expected)
      - [step 3](#step-3)
          - [Data quality: what should we do about missing
            data?](#data-quality-what-should-we-do-about-missing-data)
      - [step 4](#step-4)
          - [Data quality: do we need to make changes to the data
            shape?](#data-quality-do-we-need-to-make-changes-to-the-data-shape)
      - [step 5](#step-5)
          - [Data quality: do we need to make changes to the
            variables?](#data-quality-do-we-need-to-make-changes-to-the-variables)
      - [step 6](#step-6)
          - [Example:](#example)
              - [Who is the best major league baseball (MLB) hitter of
                all-time?](#who-is-the-best-major-league-baseball-mlb-hitter-of-all-time)
              - [The `Lahman` baseball
                package](#the-lahman-baseball-package)
      - [step 7](#step-7)
          - [Converting questions into actionable
            steps](#converting-questions-into-actionable-steps)
      - [step 8](#step-8)
          - [Incorporating expertise into
            visualizations](#incorporating-expertise-into-visualizations)
              - [Batting average vs. slugging
                percentage](#batting-average-vs.-slugging-percentage)
      - [step 9](#step-9)
          - [Letting the data guide decision
            making](#letting-the-data-guide-decision-making)
      - [step 10](#step-10)
          - [Asking better questions](#asking-better-questions)
      - [step 11](#step-11)
          - [Building graphics: visual
            cues](#building-graphics-visual-cues)
      - [step 12](#step-12)
      - [step 13](#step-13)
      - [step 14](#step-14)
      - [step 15](#step-15)
      - [step 16](#step-16)
      - [step 17](#step-17)
      - [step 18](#step-18)
      - [step 19](#step-19)
      - [step 20](#step-20)
      - [finish](#finish)
      - [Appendix 1: Katacoda scenario
        tutorials](#appendix-1-katacoda-scenario-tutorials)
      - [Appendix 2: Katacoda
        guidelines](#appendix-2-katacoda-guidelines)
      - [Appendix 3: Scenario Checklist](#appendix-3-scenario-checklist)

# setup

To see how to set up the Katacoda environment and layout, check out the
`katacoda-setup.Rmd` file.

# Outline

Below are the 20 steps (plus `intro` and `finish`) files in the
scenario.

## Objectives

The objectives for this scenario are:

  - [ ] recognize the needs of your audience (data literacy, level of
    expertise, etc.)

  - [ ] check and communicate data quality with stakeholders

  - [ ] identify the correct data visualization (single variable,
    bivariate, and multivariate graphs) based on the data

  - [ ] incorporate feedback from stakeholders/audience into graphs

  - [ ] design visualizations with the appropriate detail and
    annotations that inform (and do not mislead) the audience

## The learners

The learners I’m expecting to be participating in this course are:

  - **Jessica** will take this class on her own time for professional
    development.

  - **Peter** will this course in a two-day weekend because he needs to
    complete a project.

  - **Bruce** is using these scenarios to supplement a semester-long
    undergraduate course on R.

  - **Jane** has been told to take this course for his job because his
    team is using R.

## intro

  - [ ] included in intro.md?

### Welcome\!

Welcome to ‘*Combine narrative with numbers for effective storytelling
in R*’\! In this scenario we will cover how to build data visualizations
that present data clearly to your audience.

Now that we have some experience with data wrangling with
[`tidyr`](https://tidyr.tidyverse.org/) and
[`dplyr`](https://dplyr.tidyverse.org/), and data visualization with
[`ggplot2`](https://ggplot2.tidyverse.org/), we can put these tools
together to get your point across to stakeholders and audiences.

### What makes a great graphic?

Great graphics are

<!-- insert link to previous scenario! -->

### What makes a bad graphic?

<!-- insert link to Wilke text! -->

## step 1

  - [ ] included in step1.md?

### Who is our audience?

For this scenario, we’ll focus on a hypothetical audience of…

### Who are the stakeholders?

The stakeholders can be…

**How do stakeholders differ from the audience?**

## step 2

  - [ ] included in step2.md?

### Data quality: what are we looking at?

First we want to get a ‘*view of the forest from outside the trees*’. A
view like this ensures the data was exported from whatever source we
received it from correctly, and that there were no problems importing
it.

#### Are we seeing what we expected?

Generally speaking, we should have an idea about how many columns and
rows we should see in a dataset we’re working with. We should know some
basic information about the variable formats, too. For example, we
should know if we’re getting date columns (`YYYY-MM-DD`), logical
(`TRUE`, `FALSE`, `NA`), numerical measurements (integer (`1L`) or
double (`1`)), or categorical data (character (`male` and `female`) or
factor (`low`, `medium`, `high`)).

The packages to help with this are:

[`inspectdf`](https://alastairrushworth.github.io/inspectdf/):

[`skimr`](https://docs.ropensci.org/skimr/):

## step 3

  - [ ] included in step3.md?

### Data quality: what should we do about missing data?

[`visdat`](http://visdat.njtierney.com/)

[`naniar`](https://naniar.njtierney.com/)

Read more about visualizing missing data
[here](http://naniar.njtierney.com/articles/naniar-visualisation.html).

## step 4

  - [ ] included in step4.md?

### Data quality: do we need to make changes to the data shape?

Can we visualize the data as-is, or does it need to be restructured?

[`tidyr`](https://tidyr.tidyverse.org/) refresher

## step 5

  - [ ] included in step5.md?

### Data quality: do we need to make changes to the variables?

Are they all the correct format (character, factor, numeric, logical)?

[`dplyr`](https://dplyr.tidyverse.org/) refresher.

## step 6

  - [ ] included in step6.md?

### Example:

So far, we’ve focused on the quality of the dataset(s) we’re working
with. After checking the overall shape (total columns and rows),
variable formats, and observations (missing vs. complete), we’re ready
to start digging into the dataset. Hopefully we have an idea of the
visualization we want to build, or at least we know what variables are
of interest to our audience. At this point we usually recommend
sketching out some ideas on a piece paper or on a whiteboard. Send these
ideas out for feedback from the stakeholders or potential audience
members.

Sketching out ideas some ‘analog’ graphs takes less time than writing
code, and physically separating yourself from the keyboard and computer
screen often helps us think about the data in a more abstract way. We’ve
found some questions can be answered using a simple summary table, while
others will require complicated algorithms or models. We want to make
sure the question we’re presented with can be best answered with a data
visualization (or a combination of visualizations, tables, and models).

#### Who is the best major league baseball (MLB) hitter of all-time?

Who is asking this question? Is it someone looking to verify their
favorite player is the best, or is it a
[sabermetrician](https://en.wikipedia.org/wiki/Sabermetrics) looking to
compare different performance metrics, or is it a sports journalist
writing an article featuring top MLB sluggers over time?

All three of these audiences might have different definitions for *best*
and *hitter*.

#### The `Lahman` baseball package

To answer this question, we will be using the [`Lahman`
package](http://lahman.r-forge.r-project.org/doc/). The `Lahman` package
is a database of tables on relevant baseball statistics going all the
way back to 1871. Read more about the data tables [here on Sean Lahman’s
site](http://www.seanlahman.com/baseball-archive/statistics/).

## step 7

  - [ ] included in step7.md?

### Converting questions into actionable steps

Defining the audience for a data visualization makes it possible to
create actionable steps. If we know who will be consuming the
information in the graphs or figures, we can start making decisions
about what variables will be used, and how. As with most questions,
there will be multiple ways to show the correct answer and other sources
of data we could be use.

If we need more information to make the question necessarily precise, we
should spend more time engaging with the stakeholders or audience. Our
job is to translate the stakeholder’s problem into a question that is 1)
capable of being represented with a data visualizations, and 2)
accurately addressing their needs.

If the stakeholders are asking questions their data can’t answer, it’s
our job to tell them. It’s also important to try and find indirect or
adjacent measurements for their questions. As with most measurements,
‘hitting’ in baseball is measured in different ways, so determining
who the ‘best hitter’ is will require asking a few more questions before
we can start building visualizations.

## step 8

  - [ ] included in step8.md?

### Incorporating expertise into visualizations

Good visualizations incorporate the expertise and knowledge of the
stakeholders/audience *and* the analyst’s understanding of the data into
the display. For baseball, the best example of combining game expertise
with numerical and statistical acumen comes from Michael Lewis’s
Moneyball,

> “*When the numbers acquire the significance of language," he later
> wrote, "they acquire the power to do all of the things which language
> can do: to become fiction and drama and poetry…and it is not just
> baseball that these numbers, through a fractured mirror, describe. It
> is character. It is psychology, it is history, it is power, it is
> grace, glory, consistency, sacrifice, courage, it is success and
> failure, it is frustration and bad luck, it is ambition, it is
> overreaching, it is discipline. And it is victory and defeat, which is
> all that the idiot sub-conscious really understands.*”

#### Batting average vs. slugging percentage

Batting average is the

Slugging percentage (SLG) as a measure of the batting productivity
because it

## step 9

  - [ ] included in step9.md?

### Letting the data guide decision making

To help determine what variable(s) we should use in the data
visualization, we tend to use single-variable summary tables and simple
visualizations that display a variable’s distribution.

This process is highly iterative\! Plan on making many preliminary
graphs and tables that will not be final products. The goal during this
phase is to connect the information in the stakeholders/audiences’ head
to the variables in the dataset.

## step 10

  - [ ] included in step10.md?

### Asking better questions

When we’re want to ask questions that get us closer to what the
stakeholder is asking, or that get us closer to what we want to show to
our intended audience.

## step 11

### Building graphics: visual cues

  - [ ] included in step11.md?

## step 12

  - [ ] included in step12.md?

## step 13

  - [ ] included in step13.md?

## step 14

  - [ ] included in step14.md?

## step 15

  - [ ] included in step15.md?

## step 16

  - [ ] included in step16.md?

## step 17

  - [ ] included in step17.md?

## step 18

  - [ ] included in step18.md?

## step 19

  - [ ] included in step19.md?

## step 20

  - [ ] included in step20.md?

## finish

  - [ ] included in finish.md?

## Appendix 1: Katacoda scenario tutorials

The tutorial for building the scenario is
[here](https://katacoda.com/scenario-examples/scenarios/create-scenario-101).

I took notes on this tutorial and made them available in [this Google
document](https://docs.google.com/document/d/e/2PACX-1vSf2w2onhH5t3IhuD4sYLoWqn46BLKMYFR7q3BHO8QTaRkVgXfhKvnl8T9uHrjmbVpTZVKCWrfxEl0R/pub).

## Appendix 2: Katacoda guidelines

There are multiple guidelines and resources for writing scenarios.
O’Reilly has provided an *Authoring Guide* and *Formatting and Design
Guide*.

The link for these files can be found here:

  - [Katacoda Scenario Formatting and Design Guide for
    Authors](https://docs.google.com/document/d/1l4lofG5kAu8JFzumZPCsJJE2muCYe6rHSHCQsMlijd8/edit)

  - [Katacoda Scenario Authoring
    Guide](https://docs.google.com/document/d/14rudtruZQhRxvD3zcR3g75j5nuOgKGz4CYk8hdhaV-w/edit)

## Appendix 3: Scenario Checklist

**Scenario Readiness Checklist:**

When you think your scenario is ready for publication, we recommend you
run through the checklist below to ensure it is ready to go. \[Reminder:
We discuss these best practices in the Katacoda Formatting and Design
Guide for Authors\]:

Does the scenario start consistently and in a timely manner? More than 5
minutes to start would be cause to reconsider your build decisions.

  - [x] Are your intro and final pages present and are their respective
    goals and lessons learned in agreement?

  - [ ] Have you tested your scenario lately?

  - [x] Do you agree with the leveling (beginner, intermediate,
    advanced) you indicated when you started the build?

  - [x] Was learning time you entered correct, or should it be adjusted?

  - [ ] Are your versions of tools and other dependencies up to date?

  - [ ] Have you tried every instruction?

  - [ ] Have you written each step in the most concise manner possible?

  - [ ] Have you run your text through a spelling/grammar checker?

  - [ ] Are your credits to others given present and correct?

  - [ ] Are your images legal and with credits?

  - [ ] Are your hyperlinks all working?

  - [ ] Do the goals and lessons learned items match the steps in the
    scenario?
