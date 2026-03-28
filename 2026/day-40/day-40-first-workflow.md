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
This is the trigger which starts the pipeline
- `jobs:`
This defines the jobs that needs to be executed 
- `runs-on:`
This describes the runner on which the job runs
- `steps:`
Under each job , there are steps that will be defined here 

- `uses:`
  to use the predefined actions like `actions/checkout@v4`
- `run:`
The command that needs to be executed 
- `name:` (on a step)
  describes what the step is and what it does 

---


### Task 4: Add More Steps
Update `hello.yml` to also:
1. Print the current date and time
2. Print the name of the branch that triggered the run (hint: GitHub provides this as a variable)
3. List the files in the repo
4. Print the runner's operating system

Push again — watch the new run.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-40/images/Screenshot%202026-03-28%20131546.png)


---

### Task 5: Break It On Purpose
1. Add a step that runs a command that will **fail** (e.g., `exit 1` or a misspelled command)
2. Push and observe what happens in the Actions tab
3. Fix it and push again

Write in your notes: What does a failed pipeline look like? How do you read the error?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-40/images/Screenshot%202026-03-28%20143538.png)

After fixing the error 

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-40/images/Screenshot%202026-03-28%20131546.png)

