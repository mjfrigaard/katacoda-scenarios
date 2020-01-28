Data Wrangling, Visualizations, and Storytelling (Katacoda)
========================

This is a scenario for Katacoda (from O'Reilly). This file will walk through the setup and some tips for using the Katacoda interface.

## Step 1: Downloading CLI for Katacoda

First download the installation pack from Terminal:

```bash
npm install katacoda-cli --global
```

## Step 2: Setup scenario with Katacoda

After receiving the Katacoda Invite email, you can log into Katacoda with a Github account.

![](figs/getting-started-katecoda.png)

For example, the url for my acount is created (`https//:katacoda.com/mjfrigaard`).

The link for the katacoda documentation is [here](https://www.katacoda.com/docs).

These steps were uses to set up the scenario for Katacoda.

```bash
 % katacoda scenarios:create # this command kicks off the questions
? Friendly url:  katacoda-scenarios # the url is the same name of the folder
? Scenario Title:   # title for scenario
? Scenario Description:  How to wrangle, visualize, and communicate with data # more descriptions
? Difficulty Level:  Intermediate # how hard is this course
? Estimated time: (Please specify in minutes or hours e.g. 2 hours) 90 # how long?
? Number of Steps (Not including intro & finish):  24 # how many discrete steps
? Image:  R # what the image will be
? Layout:  Terminal + Editor for the embedded presentation
Scenario created successfully.
```

## Step 3: Setting up a Github repo

Create a new repository on Github, **without a README**, like the one located here:

https://github.com/mjfrigaard/data-wrangling-visualizations-and-storytelling

### Configuring a Github webhook

The webhook setup is covered in multiple places ([here is the official Katacoda documentation](https://katacoda.com/docs/configure-git)), but I've also inluded a [Google Document](https://docs.google.com/document/d/e/2PACX-1vSf2w2onhH5t3IhuD4sYLoWqn46BLKMYFR7q3BHO8QTaRkVgXfhKvnl8T9uHrjmbVpTZVKCWrfxEl0R/pub) that outlines this process (with ample screenshots).

### The Katacoda end...

The important parts of the configuration for Katacoda are:

Under the **Git Scenario Repository**, enter the repository from Github:

`https://github.com/mjfrigaard/name-of-repo`

Then click **Save** and **Trigger**. You should see the **Deployed Successfully** come across the screen. I clicked refresh to get the **Git Webhook Secret**. Under the **Git Webhook Secret**, enter the

`jumbletextnumbers`

### The Github end...

The important parts of the configuration for Github are:

**Payload URL:** `https://editor.katacoda.com/scenarios/updated`

**Content type:** `application/json`

**Secret:** `jumbletextnumbers`

After entering this information, you should get this message from Github,

*Okay, that hook was successfully created. We sent a ping payload to test it out! Read more about it at https://developer.github.com/webhooks/#ping-event.*

Then I went back to my Katacoda profile and clicked on the **Trigger webhook** text under **Git Scenario Repository**.

## Step 4: Push the changes to Github

After creating this repo (without a `README.md` file), I was able to enter the following code into the command line and set the remote.

These commands were used to set up the Gitub repo.

```bash
git init
git add -A
git commit -m "first commit"
```

Now I could add the remote/origin.

```bash
# …or push an existing repository from the command line
git remote add origin https://github.com/mjfrigaard/data-wrangling-visualizations-and-storytelling.git
git push -u origin master
```

## Appendix 1: Katacoda scenario tutorials

The tutorial for building the scenario is [here](https://katacoda.com/scenario-examples/scenarios/create-scenario-101).

I took notes on this tutorial and made them available in [this Google document](https://docs.google.com/document/d/e/2PACX-1vSf2w2onhH5t3IhuD4sYLoWqn46BLKMYFR7q3BHO8QTaRkVgXfhKvnl8T9uHrjmbVpTZVKCWrfxEl0R/pub).

## Appendix 2: Katacoda guidelines

There are multiple guidelines and resources for writing scenarios. O'Reilly has provided an *Authoring Guide* and *Formatting and Design Guide*.

The link for these files can be found here:

+ [Katacoda Scenario Formatting and Design Guide for Authors](https://docs.google.com/document/d/1l4lofG5kAu8JFzumZPCsJJE2muCYe6rHSHCQsMlijd8/edit)

+ [Katacoda Scenario Authoring Guide](https://docs.google.com/document/d/14rudtruZQhRxvD3zcR3g75j5nuOgKGz4CYk8hdhaV-w/edit)

## Appendix 3: Scenario Checklist

**Scenario Readiness Checklist:**

When you think your scenario is ready for publication, we recommend you run through the checklist below to ensure it is ready to go. [Reminder: We discuss these best practices in the Katacoda Formatting and Design Guide for Authors]:

Does the scenario start consistently and in a timely manner? More than 5 minutes to start would be cause to reconsider your build decisions.

- [ ] Are your intro and final pages present and are their respective goals and lessons learned in agreement?

- [ ] Have you tested your scenario lately?

- [ ] Do you agree with the leveling (beginner, intermediate, advanced) you indicated when you started the build?

- [ ] Was learning time you entered correct, or should it be adjusted?

- [ ] Are your versions of tools and other dependencies up to date?

- [ ] Have you tried every instruction?

- [ ] Have you written each step in the most concise manner possible?

- [ ] Have you run your text through a spelling/grammar checker?

- [ ] Are your credits to others given present and correct?

- [ ] Are your images legal and with credits?

- [ ] Are your hyperlinks all working?

- [ ] Do the goals and lessons learned items match the steps in the scenario?


## Scenario contents

This scenario covers...
