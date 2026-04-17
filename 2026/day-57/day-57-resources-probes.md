### Task 1: Resource Requests and Limits
1. Write a Pod manifest with `resources.requests` (cpu: 100m, memory: 128Mi) and `resources.limits` (cpu: 250m, memory: 256Mi)
2. Apply and inspect with `kubectl describe pod` — look for the Requests, Limits, and QoS Class sections
3. Since requests and limits differ, the QoS class is `Burstable`. If equal, it would be `Guaranteed`. If missing, `BestEffort`.

CPU is in millicores: `100m` = 0.1 CPU. Memory is in mebibytes: `128Mi`.

**Requests** = guaranteed minimum (scheduler uses this for placement). **Limits** = maximum allowed (kubelet enforces at runtime).

**Verify:** What QoS class does your Pod have?
  - Burstable

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Qos%20Class.png)

---

### Task 2: OOMKilled — Exceeding Memory Limits
1. Write a Pod manifest using the `polinux/stress` image with a memory limit of `100Mi`
2. Set the stress command to allocate 200M of memory: `command: ["stress"] args: ["--vm", "1", "--vm-bytes", "200M", "--vm-hang", "1"]`
3. Apply and watch — the container gets killed immediately

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Screenshot%202026-04-17%20180028.png)

CPU is throttled when over limit. Memory is killed — no mercy.

Check `kubectl describe pod` for `Reason: OOMKilled` and `Exit Code: 137` (128 + SIGKILL).

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Screenshot%202026-04-17%20180319.png)

**Verify:** What exit code does an OOMKilled container have?
    - Exit Code:137
---

### Task 3: Pending Pod — Requesting Too Much
1. Write a Pod manifest requesting `cpu: 100` and `memory: 128Gi`
2. Apply and check — STATUS stays `Pending` forever
3. Run `kubectl describe pod` and read the Events — the scheduler says exactly why: insufficient resources



![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Screenshot%202026-04-17%20181400.png)

**Verify:** What event message does the scheduler produce?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Screenshot%202026-04-17%20181535.png)

---

### Task 4: Liveness Probe
A liveness probe detects stuck containers. If it fails, Kubernetes restarts the container.

1. Write a Pod manifest with a busybox container that creates `/tmp/healthy` on startup, then deletes it after 30 seconds
2. Add a liveness probe using `exec` that runs `cat /tmp/healthy`, with `periodSeconds: 5` and `failureThreshold: 3`
3. After the file is deleted, 3 consecutive failures trigger a restart. Watch with `kubectl get pod -w`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Screenshot%202026-04-17%20212833.png)

**Verify:** How many times has the container restarted?
  - It was restarted 5 times.
---

### Task 5: Readiness Probe
A readiness probe controls traffic. Failure removes the Pod from Service endpoints but does NOT restart it.

1. Write a Pod manifest with nginx and a `readinessProbe` using `httpGet` on path `/` port `80`
2. Expose it as a Service: `kubectl expose pod <name> --port=80 --name=readiness-svc`
3. Check `kubectl get endpoints readiness-svc` — the Pod IP is listed
4. Break the probe: `kubectl exec <pod> -- rm /usr/share/nginx/html/index.html`
5. Wait 15 seconds — Pod shows `0/1` READY, endpoints are empty, but the container is NOT restarted

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Screenshot%202026-04-17%20225333.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Screenshot%202026-04-17%20225525.png)

**Verify:** When readiness failed, was the container restarted?
  - No , the container was not restarted
---

### Task 6: Startup Probe
A startup probe gives slow-starting containers extra time. While it runs, liveness and readiness probes are disabled.

1. Write a Pod manifest where the container takes 20 seconds to start (e.g., `sleep 20 && touch /tmp/started`)
2. Add a `startupProbe` checking for `/tmp/started` with `periodSeconds: 5` and `failureThreshold: 12` (60 second budget)
3. Add a `livenessProbe` that checks the same file — it only kicks in after startup succeeds

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Screenshot%202026-04-18%20002312.png)

**Verify:** What would happen if `failureThreshold` were 2 instead of 12?
   - if `failureThreshold` were 2 then , the first check will start 5secs, the file is not created .The second check will be at 10 sec and the file will still not be created and the startup probe will fail and Because the Startup Probe failed, Kubernetes assumes the container is hung or broken. It will be killed and restarted.
   - The Restart Loop: The Kubelet will terminate the container and try to start it again.
   - The Infinite Cycle: The new container starts its 20-second sleep, fails at the 10-second mark again, and gets killed again.
     Status: pod would eventually show a status of CrashLoopBackOff.
---
### Task 7: Clean Up
Delete all pods and services you created.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-57/images/Screenshot%202026-04-18%20005723.png)

