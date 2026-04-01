### Task 1: Prepare
1. Use the app you Dockerized on Day 36 (or any simple Dockerfile)
2. Add the Dockerfile to your `github-actions-practice` repo (or create a minimal one)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-01%20194225.png)


3. Make sure `DOCKER_USERNAME` and `DOCKER_TOKEN` secrets are set from Day 44

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-44/iamges/Screenshot%202026-04-01%20163954.png)


---

### Task 2: Build the Docker Image in CI
Create `.github/workflows/docker-publish.yml` that:
1. Triggers on push to `main`
2. Checks out the code
3. Builds the Docker image and tags it

**Verify:** Check the build step logs — does the image build successfully?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/docker-publish-image.png)

---

### Task 3: Push to Docker Hub
Add steps to:
1. Log in to Docker Hub using your secrets
2. Tag the image as `username/repo:latest` and also `username/repo:sha-<short-commit-hash>`
3. Push both tags

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20012743.png)


**Verify:** Go to Docker Hub — is your image there with both tags?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20012801.png)


---

### Task 4: Only Push on Main
Add a condition so the push step only runs on the `main` branch — not on feature branches or PRs.

Test it: push to a feature branch and verify the image is built but NOT pushed.



Pushing from feature 1 , only image was built and was not pushed
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20031138.png)

No images pushed
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20031410.png)

When pushed from main
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20031601.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20031724.png)

---

### Task 5: Add a Status Badge
1. Get the badge URL for your `docker-publish` workflow from the Actions tab
2. Add it to your `README.md`
3. Push — the badge should show green



![](https://github.com/samsrajyt/github-actions-practice/actions/workflows/docker-publish.yml/badge.svg)


---
### Task 6: Pull and Run It
1. On your local machine (or a cloud server), pull the image you just pushed
2. Run it
3. Confirm it works


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20032739.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20032959.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20033013.png)


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-45/images/Screenshot%202026-04-02%20033450.png)
