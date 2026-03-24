## Challenge Tasks

### Task 1: Build Your Own App Stack
Create a `docker-compose.yml` for a 3-service stack:
- A **web app** (use Python Flask, Node.js, or any language you know)
- A **database** (Postgres or MySQL)
- A **cache** (Redis)

Write a simple Dockerfile for the web app. The app doesn't need to be complex — even a "Hello World" that connects to the database is enough.

---

### Task 2: depends_on & Healthchecks
1. Add `depends_on` to your compose file so the app starts **after** the database
2. Add a **healthcheck** on the database service
3. Use `depends_on` with `condition: service_healthy` so the app waits for the database to be truly ready, not just started



---


[docker-compose.yml](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/simple-flask-app/docker-compose.yml)

If the website is accessed for the first time 
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/images/Screenshot%202026-03-25%20002846.png)


If the website is reloaded, it uses cache

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/images/Screenshot%202026-03-25%20003035.png)

**Test:** Bring everything down and up — does the app wait for the DB?
_Yes the app waits for the DB to come up_


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/images/Screenshot%202026-03-24%20204019.png)

---


### Task 3: Restart Policies
1. Add `restart: always` to your database service

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/images/Screenshot%202026-03-24%20204715.png)

2. Manually kill the database container — does it come back?

_Yes, its coming back_
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/images/Screenshot%202026-03-24%20234336.png)

3. Try `restart: on-failure` — how is it different?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/images/Screenshot%202026-03-24%20235308.png)

_Its not coming up as restart:always policy._

4. Write in your notes: When would you use each restart policy?

  _restart:always Use When: Databases, Backend APIs, Production services, Anything that must always run_

  _restart:on-failure Use When: Data processing jobs One-time migration scripts_

---

### Task 4: Custom Dockerfiles in Compose
1. Instead of using a pre-built image for your app, use `build:` in your compose file to build from a Dockerfile
2. Make a code change in your app
3. Rebuild and restart with one command

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/images/Screenshot%202026-03-25%20002456.png)

---

### Task 5: Named Networks & Volumes
1. Define **explicit networks** in your compose file instead of relying on the default
2. Define **named volumes** for database data
3. Add **labels** to your services for better organization

[docker-compose.yml](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/simple-flask-app/docker-compose.yml)


---

### Task 6: Scaling (Bonus)
1. Try scaling your web app to 3 replicas using `docker compose up --scale`
2. What happens? What breaks?
3. Write in your notes: Why doesn't simple scaling work with port mapping?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-34/images/Screenshot%202026-03-25%20004103.png)
```bash
docker compose up --scale app=3
```
**What happens? What breaks?**

_only app-1 comes up and the other instances of app doesnot come up._

**Why doesn't simple scaling work with port mapping?**

_Docker is only able to allocate one port of host and when it tries to map another app to port 5000 , its unable to do it as the port is already allocated to app-1 as shown above._







