## Challenge Tasks

### Task 1: Create Your First Pod (Nginx)
Create a file called `nginx-pod.yaml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80
```

![nginx-pod.yml](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20004648.png)

Apply it:

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20005411.png)

Verify it:
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20005748.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20010300.png)

**Verify:** Can you see the Nginx welcome page when you curl from inside the pod?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20012937.png)



### Task 2: Create a Custom Pod (BusyBox)
Write a new manifest `busybox-pod.yaml` from scratch (do not copy-paste the nginx one):

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox-pod
  labels:
    app: busybox
    environment: dev
spec:
  containers:
  - name: busybox
    image: busybox:latest
    command: ["sh", "-c", "echo Hello from BusyBox && sleep 3600"]
```

Apply and verify:

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20015035.png)

**Verify:** Can you see "Hello from BusyBox" in the logs?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20015057.png)


### Task 3: Imperative vs Declarative
You have been using the declarative approach (writing YAML, then `kubectl apply`). Kubernetes also supports imperative commands:

```bash
# Create a pod without a YAML file
kubectl run redis-pod --image=redis:latest

# Check it
kubectl get pods
```

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20021508.png)

Compare this output with your hand-written manifests. Notice how much extra metadata Kubernetes adds automatically (status, timestamps, uid, resource version).

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20021720.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20021749.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20021820.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20021840.png)

**Verify:** Save the dry-run output to a file and compare its structure with your nginx-pod.yaml. What fields are the same? What is different?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20022240.png)


### Task 4: Validate Before Applying
Before applying a manifest, you can validate it:

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20023023.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-19%20023409.png)


### Task 5: Pod Labels and Filtering
Labels are how Kubernetes organizes and selects resources. You added labels in your manifests — now use them:

```bash
# List all pods with their labels
kubectl get pods --show-labels

```
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-20%20183346.png)

```bash
# Filter pods by label
kubectl get pods -l app=nginx
kubectl get pods -l environment=dev


# Add a label to an existing pod
kubectl label pod nginx-pod environment=production

# Verify
kubectl get pods --show-labels
```
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-20%20183553.png)


```bash
# Remove a label
kubectl label pod nginx-pod environment-
```

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-20%20183941.png)


Write a manifest for a third pod with at least 3 labels (app, environment, team). Apply it and practice filtering.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/images/Screenshot%202026-03-20%20190514.png)

[nginx-pod-prod.yaml](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-51/manifest-yaml-files/nginx-pod-prod.yaml)
