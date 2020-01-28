Wrangling Data in R
================

  - [Setup](#setup)
      - [Step 1: Downloading CLI for
        Katacoda](#step-1-downloading-cli-for-katacoda)
      - [Step 2: Setup scenario with
        Katacoda](#step-2-setup-scenario-with-katacoda)
      - [Step 3: Create local repo for
        scenario](#step-3-create-local-repo-for-scenario)
      - [Step 4: Configure Github
        repository](#step-4-configure-github-repository)
          - [The Katacoda end…](#the-katacoda-end)
          - [The Github end…](#the-github-end)
      - [Step 5: Push the changes to
        Github](#step-5-push-the-changes-to-github)
      - [Appendix 1: Katacoda scenario
        tutorials](#appendix-1-katacoda-scenario-tutorials)
      - [Appendix 2: Katacoda
        guidelines](#appendix-2-katacoda-guidelines)
      - [Appendix 3: Scenario Checklist](#appendix-3-scenario-checklist)
      - [Scenario contents](#scenario-contents)

This is the `README.md` file for the Katacoda scenarios.

# Setup

This is a scenario for Katacoda (from O’Reilly). This file will walk
through the setup and some tips for using the Katacoda interface.

## Step 1: Downloading CLI for Katacoda

First download the installation pack from Terminal:

``` bash
npm install katacoda-cli --global
```

## Step 2: Setup scenario with Katacoda

After receiving the Katacoda Invite email, you can log into Katacoda
with a Github account.

For example, the url for my acount is created
(`https//:katacoda.com/mjfrigaard`).

The link for the katacoda documentation is
[here](https://www.katacoda.com/docs).

These steps were uses to set up the scenario for Katacoda.

## Step 3: Create local repo for scenario

``` bash
(base) martinfrigaard@Martins-MBP @projects % katacoda scenarios:create
? Friendly url:  wrangling-data-in-r
? Scenario Title:  Wrangling Data in R
? Scenario Description:  Learn how to wrangle variables, rows, and entire data sets
? Difficulty Level:  Intermediate
? Estimated time: (Please specify in minutes or hours e.g. 2 hours) 30 min
? Number of Steps (Not including intro & finish):  5
? Image:  R
? Layout:  Terminal + Editor for the embedded presentation
Scenario created successfully.
```

This creates the following folder contents:

``` bash
├── README.Rmd
├── README.md
├── finish.md
├── index.json
├── intro.md
├── step1.md
├── step2.md
├── step3.md
├── step4.md
├── step5.md
├── wrangling-data-in-r.Rproj
└── xREADME.md
```

I’ve added the `wrangling-data-in-r.Rproj` file (to use RStudio).

## Step 4: Configure Github repository

Create a new repository on Github, **without a README**, like the one
located here:

The webhook setup is covered in multiple places. [Here is the official
Katacoda documentation](https://katacoda.com/docs/configure-git), but
I’ve also inluded a [Google
Document](https://docs.google.com/document/d/e/2PACX-1vSf2w2onhH5t3IhuD4sYLoWqn46BLKMYFR7q3BHO8QTaRkVgXfhKvnl8T9uHrjmbVpTZVKCWrfxEl0R/pub)
that outlines this process (with ample screenshots).

### The Katacoda end…

The important parts of the configuration for Katacoda are:

Under the **Git Scenario Repository**, enter the repository from Github:

`https://github.com/mjfrigaard/name-of-repo`

Then click **Save** and **Trigger**. You should see the **Deployed
Successfully** come across the screen. I clicked refresh to get the
**Git Webhook Secret**. Under the **Git Webhook Secret**, enter the

`jumbletextnumbers`

### The Github end…

The important parts of the configuration for Github are:

**Payload URL:** `https://editor.katacoda.com/scenarios/updated`

**Content type:** `application/json`

**Secret:** `jumbletextnumbers`

After entering this information, you should get this message from
Github,

*Okay, that hook was successfully created. We sent a ping payload to
test it out\! Read more about it at
<https://developer.github.com/webhooks/#ping-event>.*

## Step 5: Push the changes to Github

After creating this repo (without a `README.md` file), I was able to
enter the following code into the command line and set the remote.

These commands were used to set up the Gitub repo.

``` bash
git init
git add -A
git commit -m "first commit"
```

Now I could add the remote/origin.

``` bash
# …or push an existing repository from the command line
git remote add origin https://github.com/mjfrigaard/katacoda-scenarios.git
git push -u origin master
```

-----

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

  - [ ] Are your intro and final pages present and are their respective
    goals and lessons learned in agreement?

  - [ ] Have you tested your scenario lately?

  - [ ] Do you agree with the leveling (beginner, intermediate,
    advanced) you indicated when you started the build?

  - [ ] Was learning time you entered correct, or should it be adjusted?

  - [ ] Are your versions of tools and other dependencies up to date?

  - [ ] Have you tried every instruction?

  - [ ] Have you written each step in the most concise manner possible?

  - [ ] Have you run your text through a spelling/grammar checker?

  - [ ] Are your credits to others given present and correct?

  - [ ] Are your images legal and with credits?

  - [ ] Are your hyperlinks all working?

  - [ ] Do the goals and lessons learned items match the steps in the
    scenario?

## Scenario contents

This scenario covers…
