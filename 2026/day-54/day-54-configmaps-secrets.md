### Task 1: Create a ConfigMap from Literals
1. Use `kubectl create configmap` with `--from-literal` to create a ConfigMap called `app-config` with keys `APP_ENV=production`, `APP_DEBUG=false`, and `APP_PORT=8080`
2. Inspect it with `kubectl describe configmap app-config` and `kubectl get configmap app-config -o yaml`
3. Notice the data is stored as plain text — no encoding, no encryption




![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-54/images/Screenshot%202026-04-13%20224754.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-54/images/Screenshot%202026-04-13%20232848.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-54/images/Screenshot%202026-04-14%20000051.png)


**Verify:** Can you see all three key-value pairs?
  - Yes

---

### Task 2: Create a ConfigMap from a File
1. Write a custom Nginx config file that adds a `/health` endpoint returning "healthy"
2. Create a ConfigMap from this file using `kubectl create configmap nginx-config --from-file=default.conf=<your-file>`
3. The key name (`default.conf`) becomes the filename when mounted into a Pod

**Verify:** Does `kubectl get configmap nginx-config -o yaml` show the file contents?


