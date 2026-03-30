## Challenge Tasks

### Task 1: GitHub-Hosted Runners
1. Create a workflow with 3 jobs, each on a different OS:
   - `ubuntu-latest`
   - `windows-latest`
   - `macos-latest`
2. In each job, print:
   - The OS name
   - The runner's hostname
   - The current user running the job
3. Watch all 3 run in parallel


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-30%20221034.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-30%20221114.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-30%20221143.png)


Write in your notes: What is a GitHub-hosted runner? Who manages it?

  - `Github-hosted` runner is a temporary virtual machine provided by GitHub that runs GitHub Actions workflows.

    - `GitHub-hosted` runners are managed by GitHub on Microsoft Azure infrastructure.
    - Responsible for:
        - Creating the virtual machine
        - Installing software
        -  Maintaining security
        - Deleting the machine after the job completes.

---

### Task 2: Explore What's Pre-installed
1. On the `ubuntu-latest` runner, run a step that prints:
   - Docker version
   - Python version
   - Node version
   - Git version

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-30%20223651.png)

2. Look up the GitHub docs for the full list of pre-installed software on `ubuntu-latest`

[Pre-installed software list](https://github.com/actions/runner-images?tab=readme-ov-file)

Write in your notes: Why does it matter that runners come with tools pre-installed?

* **It matters because pre-installed tools make workflows faster and easier to configure. Developers can run builds and tests immediately without installing common tools like Docker, Python, Node.js, and Git, while GitHub maintains and updates the environment.**
---

### Task 3: Set Up a Self-Hosted Runner
1. Go to your GitHub repo → Settings → Actions → Runners → **New self-hosted runner**
2. Choose Linux as the OS
3. Follow the instructions to download and configure the runner on:
   - Your local machine, OR
   - A cloud VM (EC2, Utho, or any VPS)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-30%20230709.png)



4. Start the runner — verify it shows as **Idle** in GitHub

**Verify:** Your runner appears in the Runners list with a green dot.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-31%20011521.png)




---

### Task 4: Use Your Self-Hosted Runner
1. Create `.github/workflows/self-hosted.yml`
2. Set `runs-on: self-hosted`
3. Add steps that:
   - Print the hostname of the machine (it should be YOUR machine/VM)
   - Print the working directory
   - Create a file and verify it exists on your machine after the run
4. Trigger it and watch it run on your own hardware

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-30%20234800.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-31%20011322.png)


**Verify:** Check your machine — is the file there?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-31%20000348.png)




---

### Task 5: Labels
1. Add a **label** to your self-hosted runner (e.g., `my-linux-runner`)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-31%20001715.png)

2. Update your workflow to use `runs-on: [self-hosted, my-linux-runner]`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-31%20003104.png)

3. Trigger it — does it still pick up the job?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-42/images/Screenshot%202026-03-31%20003240.png)

Write in your notes: Why are labels useful when you have multiple self-hosted runners?

When managing multiple self-hosted runners, labels act as a filter that allows to choose a specific runner made for its task.
Without labels, GitHub Actions would treat all your runners as a single pool.

---

### Task 6: GitHub-Hosted vs Self-Hosted
Fill this in your notes:

| | GitHub-Hosted | Self-Hosted |
|---|---|---|
|Who manages it? | GitHub | Owner of the host |
|Cost | Free for public repos; usage limits for private | Hardware/Infrastructure costs |
|Pre-installed tools | Yes | No |
|Good for | Simple setups, standard environments | Highly customized or high-performance needs |
|Security concern | Shared infrastructure | Maintenance and network security is on you |

---
