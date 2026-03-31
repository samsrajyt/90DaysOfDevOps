

### Task 1: The Problem
Think about a team of 5 developers all pushing code to the same repo manually deploying to production.

Write in your notes:
1.  What can go wrong?

  - Manual Errors: Missing a configuration step or running commands in the wrong order.
  - Code Collisions: Multiple developers overwriting each other's changes without a centralized build process.
  - Lack of Traceability: Difficulty identifying which specific change caused a production failure.
  - Security: Manual access to production servers by multiple people increases the "attack surface" and risk of accidental leaks.

2.  "It Works on My Machine"

  - Definition: A situation where code runs perfectly in a local development environment but fails in production.
  - The Root Cause: Environmental Drift. Differences in Operating Systems, library versions, or background configurations.
  - The Solution: Containerization (like Docker) to ensure the environment stays identical from the laptop to the cloud.

3.  Manual Deployment Frequency

  - Frequency: Usually limited to once per week or month via scheduled maintenance windows.
  - Risk Factor: Manual deployments are "high-stakes" because they often involve large batches of code, making troubleshooting much harder compared to frequent, automated micro-deployments.

---

### Task 2: CI vs CD
Research and write short definitions (2-3 lines each):

Write one real-world example for each.

1. **Continuous Integration** — what happens, how often, what it catches
    Continious Integration is the Devops software development process in which developers frequently merges code into the central repositories and thereafter build and testing stages start ,frequently pushing code enables faster bug detetction , improved software and reduce the time taken to validate and release new software updates. 


2. **Continious Delivery** — how it's different from CI, what "delivery" means

    Continious Delivery means the frequent and predicatable delivery of quality software to the end users from source code repository to production in an automated fashion. Delivery means that there's a approval needed to deliver the software updates right before it hits production.
    Eg : Sending software updates in production for any e-commerce platform like amazon or ebay




3. **Continuous Deployment** — how it differs from Delivery, when teams use it
     Continious Deployments means that software updates everything is automated and there is no requirement of manual clicks .
     Continuous deployment goes one step further than continuous delivery. With this practice, every change that passes all stages of your production pipeline is released to your customers. There's no human intervention, and only a failed test will prevent a new change to be deployed to production.
      
     Eg. Apps like instagram which gets autoupdated in the backgorund

---

### Task 3: Pipeline Anatomy

- **Trigger**
    - The event that starts the pipeline.
    - This could be a `code push`,`pull request`,`scheduled time` or `workflow_dispatch`

- **Stage**
    - A logical phase in the pipeline.
    - Common stages include `build`, `test`and `deploy`. 
    - Stages help organize the workflow and often run in a defined order

- **Job**
    - A unit of work within a stage.
    - Each job runs independently and can contain multiple steps.
    - Example: a "Run Unit Tests" job inside the Test stage.

- **Steps**
    - A single command or action inside a job.
    - Steps are the building blocks of jobs like running a script,installing dependencies or executing tests.

- **Runner**
    - The machine (physical or virtual) that executes the job.
    - Runners provide the environment where all steps of a job actually run.

- **Artifact**
    - Any output produced by a job
    - The files or packages produced by a job (like a `.jar` file or `Docker image`) that are passed to later stages or saved for release.
---

### Task 4: Draw a Pipeline
Draw a CI/CD pipeline for this scenario:
> A developer pushes code to GitHub. The app is tested, built into a Docker image, and deployed to a staging server.

Include at least 3 stages. Hand-drawn and photographed is perfectly fine.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-39/images/Screenshot%202026-03-28%20005153.png)
---

### Task 5: Explore in the Wild
1. Open any popular open-source repo on GitHub (Kubernetes, React, FastAPI — pick one you know)

   [derailed/k9s](https://github.com/derailed/k9s/blob/master/.github/workflows/test.yml)

2. Find their `.github/workflows/` folder
3. Open one workflow YAML file

   ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-39/images/Screenshot%202026-03-28%20000847.png)

   
4. Write in your notes:
   - What triggers it?
```
on:
  workflow_dispatch:
    push:
    branches:
      - master
    tags:
      - rc*
      - v*
```
  When there is a push on branch master with tags starting with rc or v , the pipeline will only start when it's manually started .
      
   - How many jobs does it have?
     Only one job
   
   - What does it do? (best guess)
     Checks out the code from the repository 
     installs Go with the version mentioned in the file go.mod
     Sets up the go environment
     Runs test 
---



