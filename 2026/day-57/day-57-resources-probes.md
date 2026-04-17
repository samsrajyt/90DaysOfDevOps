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
