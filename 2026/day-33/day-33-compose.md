---
### Task 1: Install & Verify
1. Check if Docker Compose is available on your machine
2. Verify the version

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-19%20162128.png)

---

### Task 2: Your First Compose File

1. Create a folder `compose-basics`

2. Write a `docker-compose.yml` that runs a single **Nginx** container with port mapping

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-19%20162411.png)


3. Start it with `docker compose up`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-19%20162607.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-19%20162855.png)

4. Access it in your browser

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-19%20163025.png)

5. Stop it with `docker compose down`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-19%20163204.png)

---

### Task 3: Two-Container Setup
Write a `docker-compose.yml` that runs:
- A **WordPress** container
- A **MySQL** container

They should:
- Be on the same network (Compose does this automatically)
- MySQL should have a named volume for data persistence
- WordPress should connect to MySQL using the service name

Start it, access WordPress in your browser, and set it up.

[docker-compose.yaml](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/wordpress/docker-compose.yaml)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-20%20001944.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-20%20001524.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-20%20001840.png)


**Verify:** Stop and restart with `docker compose down` and `docker compose up` — is your WordPress data still there?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-20%20005050.png)
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-33/images/Screenshot%202026-03-20%20005107.png)


