### Task 1: See the Problem — Data Lost on Pod Deletion
1. Write a Pod manifest that uses an `emptyDir` volume and writes a timestamped message to `/data/message.txt`
2. Apply it, verify the data exists with `kubectl exec`
3. Delete the Pod, recreate it, check the file again — the old message is gone

**Verify:** Is the timestamp the same or different after recreation?
  - No , its not the same.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-15%20195707.png)


---

### Task 2: Create a PersistentVolume (Static Provisioning)
1. Write a PV manifest with `capacity: 1Gi`, `accessModes: ReadWriteOnce`, `persistentVolumeReclaimPolicy: Retain`, and `hostPath` pointing to `/tmp/k8s-pv-data`
2. Apply it and check `kubectl get pv` — status should be `Available`

Access modes to know:
- `ReadWriteOnce (RWO)` — read-write by a single node
- `ReadOnlyMany (ROX)` — read-only by many nodes
- `ReadWriteMany (RWX)` — read-write by many nodes

`hostPath` is fine for learning, not for production.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-15%20205103.png)

**Verify:** What is the STATUS of the PV?
   - Available

---

### Task 3: Create a PersistentVolumeClaim
1. Write a PVC manifest requesting `500Mi` of storage with `ReadWriteOnce` access
2. Apply it and check both `kubectl get pvc` and `kubectl get pv`
3. Both should show `Bound` — Kubernetes matched them by capacity and access mode

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-15%20223402.png)

**Verify:** What does the VOLUME column in `kubectl get pvc` show?
   - pv-sample



---
