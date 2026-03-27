---

## Challenge Tasks

### Task 1: Set Up
1. Create a new **public** GitHub repository called `github-actions-practice`
2. Clone it locally
3. Create the folder structure: `.github/workflows/`

---

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-40/images/Screenshot%202026-03-28%20011046.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-40/images/Screenshot%202026-03-28%20011106.png)


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-40/images/Screenshot%202026-03-28%20011803.png)


---

### Task 2: Hello Workflow
Create `.github/workflows/hello.yml` with a workflow that:
1. Triggers on every `push`
2. Has one job called `greet`
3. Runs on `ubuntu-latest`
4. Has two steps:
   - Step 1: Check out the code using `actions/checkout`
   - Step 2: Print `Hello from GitHub Actions!`

Push it. Go to the **Actions** tab on GitHub and watch it run.

**Verify:** Is it green? Click into the job and read every step.
Yes , the pipeline succeded
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-40/images/Screenshot%202026-03-28%20015301.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-40/images/Screenshot%202026-03-28%20015342.png)


---

---

### Task 3: Understand the Anatomy
Look at your workflow file and write in your notes what each key does:
- `on:`
- `jobs:`
- `runs-on:`
- `steps:`
- `uses:`
- `run:`
- `name:` (on a step)

---


### Task 4: Add More Steps
Update `hello.yml` to also:
1. Print the current date and time
2. Print the name of the branch that triggered the run (hint: GitHub provides this as a variable)
3. List the files in the repo
4. Print the runner's operating system

Push again — watch the new run.

---
