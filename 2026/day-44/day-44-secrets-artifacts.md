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

---

