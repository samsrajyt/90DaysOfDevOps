### Task 1: Pick Your App
Choose **one** of these (or use your own project):
- A **Python Flask/Django** app with a database
- A **Node.js Express** app with MongoDB
- A **static website** served by Nginx with a backend API
- Any app from your GitHub that doesn't have Docker yet

If you don't have an app, clone a simple open-source one and Dockerize it.

I choose AI Bank Application.
[AI Bank App](https://github.com/TrainWithShubham/AI-BankApp-DevOps/tree/main)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-36/images/Screenshot%202026-03-25%20221907.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-36/images/Screenshot%202026-03-25%20221924.png)

---

### Task 2: Write the Dockerfile
1. Create a Dockerfile for your application
2. Use a **multi-stage build** if applicable
3. Use a **non-root user**
4. Keep the image **small** — use alpine or slim base images
5. Add a `.dockerignore` file

Build and test it locally.

[Dockerfile.Multistage](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-36/aibankapp-composefiles/Dockerfile.multistage)

Note : COPY --from=builder /app/target/*.jar app.jar (Only the jar file is copied from the target)

The Multistage build is 384 MB when compared to single build which is around 1.16GB
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-36/images/Screenshot%202026-03-26%20005328.png)

---

### Task 3: Add Docker Compose
Write a `docker-compose.yml` that includes:
1. Your **app** service (built from Dockerfile)
2. A **database** service (Postgres, MySQL, MongoDB — whatever your app needs)
3. **Volumes** for database persistence
4. A **custom network**
5. **Environment variables** for configuration (use `.env` file)
6. **Healthchecks** on the database


[docker-compose.yml](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-36/aibankapp-composefiles/docker-compose.yml)

---

### Task 4: Ship It
1. Tag your app image
2. Push it to Docker Hub
3. Share the Docker Hub link
4. Write a `README.md` in your project with:
   - What the app does
   - How to run it with Docker Compose
   - Any environment variables needed


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-36/images/Screenshot%202026-03-26%20011410.png)

[Link to my Image](https://hub.docker.com/repository/docker/samsraj/ai-bankapp-mini/general)

   - What the app does?
     Its a banking application, a 3 tier application with AI integrations.

     
   - How to run it with Docker Compose
     Clone the repo and add the Docker file and docker-compose file ,run
   ```bash
        docker-compose up
   ```
   
   - Any environment variables needed
     Yes , you need these env variables 

      MYSQL_ROOT_USER
      MYSQL_USER
      MYSQL_PASSWORD
      MYSQL_ROOT_PASSWORD
      MYSQL_HOST
      MYSQL_DATABASE 
      OLLAMA_URL

     For intergrating AI , once the container is up , ypu need to execute the following command inside the Ollama container
     ```bash
     docker exec -it ollama ollama run tinyllama
     ```
---


### Task 5: Test the Whole Flow
1. Remove all local images and containers
2. Pull from Docker Hub and run using only your compose file
3. Does it work fresh? If not — fix it until it does

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-36/images/Screenshot%202026-03-26%20014051.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-36/images/Screenshot%202026-03-26%20013049.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-36/images/Screenshot%202026-03-26%20014451.png)
