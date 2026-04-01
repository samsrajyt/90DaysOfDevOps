### Task 1: GitHub Secrets
1. Go to your repo → Settings → Secrets and Variables → Actions
2. Create a secret called `MY_SECRET_MESSAGE`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20010540.png)


3. Create a workflow that reads it and prints: `The secret is set: true` (never print the actual value)
4. Try to print `${{ secrets.MY_SECRET_MESSAGE }}` directly — what does GitHub show?
   GitHub masks the secret message when we try to print it .

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20015838.png)


Write in your notes: Why should you never print secrets in CI logs?
We should never print secrets because , hackers can use this info and try to inject malicious code .


---

### Task 2: Use Secrets as Environment Variables
1. Pass a secret to a step as an environment variable
2. Use it in a shell command without ever hardcoding it

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20021212.png)


3. Add `DOCKER_USERNAME` and `DOCKER_TOKEN` as secrets (you'll need these on Day 45)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20163954.png)

---

### Task 3: Upload Artifacts
1. Create a step that generates a file — e.g., a test report or a log file
2. Use `actions/upload-artifact` to save it
3. After the workflow runs, download the artifact from the Actions tab



Notes: [upload-artifact](https://github.com/actions/upload-artifact)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20163104.png)


**Verify:** Can you see and download it from GitHub?
  - yes iam able to download the artifact
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20163244.png)

---

### Task 4: Download Artifacts Between Jobs
1. Job 1: generate a file and upload it as an artifact
2. Job 2: download the artifact from Job 1 and use it (print its contents)


[GitHub download artifact action](https://github.com/actions/download-artifact?tab=readme-ov-file#download-artifacts-by-id)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20171044.png)

Write in your notes: When would you use artifacts in a real pipeline?

---

### Task 5: Run Real Tests in CI
Take any script from your earlier days (Python or Shell) and run it in CI:
1. Add your script to the `github-actions-practice` repo
2. Write a workflow that:
   - Checks out the code
   - Installs any dependencies needed
   - Runs the script
   - Fails the pipeline if the script exits with a non-zero code
3. Intentionally break the script — verify the pipeline goes red
4. Fix it — verify it goes green again

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20171643.png)

After fixing the error 

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20171946.png)

---

### Task 6: Caching
1. Add `actions/cache` to a workflow that installs dependencies
2. Run it twice — observe the time difference


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20174711.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20180751.png)

3. Write in your notes: What is being cached and where is it stored?
   All the packages which were in requirements.txt are cached.
   The cache for pip is stored in ~/.cache/pip.
---
