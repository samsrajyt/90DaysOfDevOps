### Task 1: Scan Your Docker Image for Vulnerabilities
Your Docker image might use a base image with known security issues. Let's find out.

Add this step to your main branch pipeline (after Docker build, before deploy):
```yaml
- name: Scan Docker Image for Vulnerabilities
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: 'your-username/your-app:latest'
    format: 'table'
    exit-code: '1'
    severity: 'CRITICAL,HIGH'
```

What this does:
- `trivy` scans your Docker image for known CVEs (Common Vulnerabilities and Exposures)
- `format: 'table'` prints a readable table in the logs
- `exit-code: '1'` means **fail the pipeline** if CRITICAL or HIGH vulnerabilities are found
- If it passes, your image is clean — proceed to push and deploy

Used .trivyignore file to bypass the two vulnerabilties faced earlier in trivy scan .
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-10%20003938.png)

Push and check the Actions tab. Read the scan output.

**Verify:** Can you see the vulnerability table in the logs? Did it pass or fail?
  - Yes, i see OS related vulnerablilites.

  ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-09%20223045.png)


Write in your notes: 

  What CVEs (if any) were found?
  - CVE-2025-69720
  - CVE-2026-29111
    
  What base image are you using?
  - Base Image: python:3.14-slim

---

### Task 2: Enable GitHub's Built-in Secret Scanning
GitHub can automatically detect if someone pushes a secret (API key, token, password) to your repo.

1. Go to your repo → Settings → **Code security and analysis**
2. Enable **Secret scanning**
3. If available, also enable **Push protection** — this blocks the push entirely if a secret is detected

That's it — no workflow changes needed. GitHub does this automatically.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-10%20005317.png)

Write in your notes:

  `secret scanning`  
  - Monitors your repository’s commit history and pull requests for accidentally committed secrets (like API keys, tokens, passwords).
  - Sends alerts or notifications if any secret is detected after the push.

  `push protection`
  - Works before the push is accepted.
  - Blocks commits or pushes entirely if a secret is detected in the pushed code, preventing secrets from entering the repository at all.

- What happens if GitHub detects a leaked AWS key in your repo?
  - Secret scanning detects the AWS key in your commits or pull requests.
  - GitHub alerts you and the key’s provider (AWS) about the potential leak.

---
### Task 3: Scan Dependencies for Known Vulnerabilities
If your app uses packages (pip, npm, etc.), those packages might have known vulnerabilities.

Add this to your **PR pipeline** (not the main pipeline):
```yaml
- name: Check Dependencies for Vulnerabilities
  uses: actions/dependency-review-action@v4
  with:
    fail-on-severity: critical
```

This checks any **new** dependencies added in the PR against a vulnerability database. If a dependency has a critical CVE, the PR check fails.

Test it:
1. Open a PR that adds a package to your app
2. Check the Actions tab — did the dependency review run?
   - Yes

**Verify:** Does the dependency review show up as a check on your PR?
   - Yes 

Issues Faced:
I enabled dependency graph for dependencies scan to work.
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-10%20012437.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-10%20180912.png)


---

### Task 4: Add Permissions to Your Workflows
By default, workflows get broad permissions. Lock them down.

Add this block near the top of your workflow files (after `on:`):
```yaml
permissions:
  contents: read
```

If a workflow needs to comment on PRs, add:
```yaml
permissions:
  contents: read
  pull-requests: write
```

Update at least 2 of your existing workflow files with a `permissions` block.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-10%20155740.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-10%20155915.png)

Write in your notes: 

Why is it a good practice to limit workflow permissions? What could go wrong if a compromised action has write access to your repo?

- It reduces the risk if a workflow or action is compromised.

- If a malicious code is injected into an action which has write access, it could modify your code, steal secrets, push unauthorized changes, or even delete branches—essentially taking control of your repo.



---

### Task 5: See the Full Secure Pipeline
Look at what your pipeline does now:

```
PR opened
  → build & test
  → dependency vulnerability check     ← NEW (Day 49)
  → PR checks pass or fail

Merge to main
  → build & test
  → Docker build
  → Trivy image scan (fail on CRITICAL) ← NEW (Day 49)
  → Docker push (only if scan passes)
  → deploy

Always active
  → GitHub secret scanning              ← NEW (Day 49)
  → push protection for secrets         ← NEW (Day 49)
```

Draw this diagram in your notes. You just built a **DevSecOps pipeline** — security is now part of your automation, not an afterthought.


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-10%20195741.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-10%20195933.png)  



### Upload Scan Results to GitHub Security Tab
Add SARIF output to Trivy and upload it — your scan results will appear in the repo's **Security** tab:
```yaml
- uses: aquasecurity/trivy-action@master
  with:
    image-ref: 'your-username/your-app:latest'
    format: 'sarif'
    output: 'trivy-results.sarif'
- uses: github/codeql-action/upload-sarif@v3
  with:
    sarif_file: 'trivy-results.sarif'
```

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-49/images/Screenshot%202026-04-10%20200430.png)
