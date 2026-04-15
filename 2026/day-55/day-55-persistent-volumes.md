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

### Task 4: Use the PVC in a Pod — Data That Survives
1. Write a Pod manifest that mounts the PVC at `/data` using `persistentVolumeClaim.claimName`
2. Write data to `/data/message.txt`, then delete and recreate the Pod
3. Check the file — it should contain data from both Pods


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-16%20002007.png)

**Verify:** Does the file contain data from both the first and second Pod?
  - Yes the file contains the data of the first and second Pod.


---

### Task 5: StorageClasses and Dynamic Provisioning
1. Run `kubectl get storageclass` and `kubectl describe storageclass`
2. Note the provisioner, reclaim policy, and volume binding mode
3. With dynamic provisioning, developers only create PVCs — the StorageClass handles PV creation automatically

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-16%20002354.png)

**Verify:** What is the default StorageClass in your cluster?
   - standard

---

### Task 6: Dynamic Provisioning
1. Write a PVC manifest that includes `storageClassName: standard` (or your cluster's default)
2. Apply it — a PV should appear automatically in `kubectl get pv`


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-16%20012002.png)

3. Use this PVC in a Pod, write data, verify it works

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-16%20013110.png)

    - Here since the since the VOLUMEBINDINGMODE is WaitForFirstConsumer , the pv is dynamically not created until any pod is assigned to it and hence pv is created once a pod is assigned to it .
**Verify:** How many PVs exist now? Which was manual, which was dynamic?
    
     
  - There are 2 PVs , one is manually created whilst the other is dynamically created.
     
     ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-16%20013359.png)

---

### Task 7: Clean Up
1. Delete all pods first
2. Delete PVCs — check `kubectl get pv` to see what happened
3. The dynamic PV is gone (Delete reclaim policy). The manual PV shows `Released` (Retain policy).

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-16%20014313.png)

4. Delete the remaining PV manually

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-55/images/Screenshot%202026-04-16%20014628.png)

**Verify:** Which PV was auto-deleted and which was retained? Why?
  - The Dynamic PV was deleted as the reclaim policy of the dynamic PV was delete .
