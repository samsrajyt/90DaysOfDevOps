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

**Verify:** Go to Docker Hub — is your image there with both tags?


