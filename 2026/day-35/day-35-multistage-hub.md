## Challenge Tasks

### Task 1: The Problem with Large Images
1. Write a simple Go, Java, or Node.js app (even a "Hello World" is fine)
2. Create a Dockerfile that builds and runs it in a **single stage**
3. Build the image and check its **size**


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-35/images/Screenshot%202026-03-25%20145349.png)

---

### Task 2: Multi-Stage Build
1. Rewrite the Dockerfile using **multi-stage build**:
   - Stage 1: Build the app (install dependencies, compile)
   - Stage 2: Copy only the built artifact into a minimal base image (`alpine`, `distroless`, or `scratch`)
2. Build the image and check its size again
3. Compare the two sizes

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-35/images/Screenshot%202026-03-25%20150159.png)

Write in your notes: Why is the multi-stage image so much smaller?

_We build the dependencies in seperate container and copy that to another distroless container which has is of smaller size and thus we are able o reduce its size._

---

### Task 3: Push to Docker Hub
1. Create a free account on [Docker Hub](https://hub.docker.com) (if you don't have one)
2. Log in from your terminal
3. Tag your image properly: `yourusername/image-name:tag`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-35/images/Screenshot%202026-03-25%20151035.png)

4. Push it to Docker Hub

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-35/images/Screenshot%202026-03-25%20151131.png)

5. Pull it on a different machine (or after removing locally) to verify

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-35/images/Screenshot%202026-03-25%20151334.png)

---

### Task 4: Docker Hub Repository
1. Go to Docker Hub and check your pushed image
2. Add a **description** to the repository
3. Explore the **tags** tab — understand how versioning works


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-35/images/Screenshot%202026-03-25%20151549.png)

4. Pull a specific tag vs `latest` — what happens?
   When you pull a specific tag that version of the image gets pulled and if you dont specify the tag it will by default take latest version of the image.

   



