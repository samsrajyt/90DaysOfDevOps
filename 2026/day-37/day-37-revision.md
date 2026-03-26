## Self-Assessment Checklist
Mark yourself honestly — **can do**, **shaky**, or **haven't done**:

- [ **can do** ] Run a container from Docker Hub (interactive + detached)
- [ **can do** ] List, stop, remove containers and images
- [ **shaky** ] Explain image layers and how caching works
- [ **can do** ] Write a Dockerfile from scratch with FROM, RUN, COPY, WORKDIR, CMD
- [ **can do** ] Explain CMD vs ENTRYPOINT
- [ **can do** ] Build and tag a custom image
- [ **can do** ] Create and use named volumes
- [ **can do** ] Use bind mounts
- [ **can do** ] Create custom networks and connect containers
- [ **can do** ] Write a docker-compose.yml for a multi-container app
- [ **can do** ] Use environment variables and .env files in Compose
- [ **can do** ] Write a multi-stage Dockerfile
- [ **can do** ] Push an image to Docker Hub
- [ **can do** ] Use healthchecks and depends_on


## Quick-Fire Questions
Answer from memory, then verify:
1. What is the difference between an image and a container?

   _An image is a read only file , which consists of instruction to create a container_
   _A container is a running instance of an image._

2. What happens to data inside a container when you remove it?

   _ All the data inside is lost unless its persisted with volumes or bind mounts._

3. How do two containers on the same custom network communicate?

   _They use their names to communicate._

4. What does `docker compose down -v` do differently from `docker compose down`?

   _`docker compose down -v ` brings down the network and containers along with the volumes defined in docker compose, whereas `docker compose down` just brings down the network and containers._

5. Why are multi-stage builds useful?
   
   _They help in reducing the size of the image and also secures the image._

6. What is the difference between `COPY` and `ADD`?

   _Both COPY and ADD does the same thing but ADD gives an extra feature of downloading file from internet and also enables to extarct .tar files as it auto extracts when copied on to the container._

7. What does `-p 8080:80` mean?

   _ Port 8080 of the host is mapped to port 80 of the container._


8. How do you check how much disk space Docker is using?
   _```bash docker system df ```_
