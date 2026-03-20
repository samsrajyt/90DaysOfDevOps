### Task 1: Explore Default Namespaces
Kubernetes comes with built-in namespaces. List them:

```bash
kubectl get namespaces
```

You should see at least:
- `default` — where your resources go if you do not specify a namespace
- `kube-system` — Kubernetes internal components (API server, scheduler, etc.)
- `kube-public` — publicly readable resources
- `kube-node-lease` — node heartbeat tracking

Check what is running inside `kube-system`:
```bash
kubectl get pods -n kube-system
```

These are the control plane components keeping your cluster alive. Do not touch them.



---

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-52/images/Screenshot%202026-03-20%20200209.png)


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-52/images/Screenshot%202026-03-20%20200434.png)

**Verify:** How many pods are running in `kube-system`?

  _There are 14 pods running in `kube-system`._

---

---

### Task 2: Create and Use Custom Namespaces
Create two namespaces — one for a development environment and one for staging:

```bash
kubectl create namespace dev
kubectl create namespace staging
```

Verify they exist:
```bash
kubectl get namespaces
```
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-52/images/Screenshot%202026-03-20%20201326.png)

You can also create a namespace from a manifest:
```yaml
# namespace.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: production
```

```bash
kubectl apply -f namespace.yaml
```

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-52/images/Screenshot%202026-03-20%20201620.png)

Now run a pod in a specific namespace:
```bash
kubectl run nginx-dev --image=nginx:latest -n dev
kubectl run nginx-staging --image=nginx:latest -n staging
```

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-52/images/Screenshot%202026-03-20%20202007.png)

List pods across all namespaces:
```bash
kubectl get pods -A
```

Notice that `kubectl get pods` without `-n` only shows the `default` namespace. You must specify `-n <namespace>` or use `-A` to see everything.

**Verify:** Does `kubectl get pods` show these pods? What about `kubectl get pods -A`?

---
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-52/images/Screenshot%202026-03-20%20202159.png)

`kubectl get pods ` doesnot show the pods which were created.
`kubectl get pods -A` shows all the pods running in all namespaces.



---

### Task 3: Create Your First Deployment
A Deployment tells Kubernetes: "I want X replicas of this Pod running at all times." If a Pod crashes, the Deployment controller recreates it automatically.

Create a file `nginx-deployment.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: dev
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.24
        ports:
        - containerPort: 80
```

Key differences from a standalone Pod:
- `kind: Deployment` instead of `kind: Pod`
- `apiVersion: apps/v1` instead of `v1`
- `replicas: 3` tells Kubernetes to maintain 3 identical pods
- `selector.matchLabels` connects the Deployment to its Pods
- `template` is the Pod template — the Deployment creates Pods using this blueprint

Apply it:
```bash
kubectl apply -f nginx-deployment.yaml
```
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-52/images/Screenshot%202026-03-20%20212825.png)

Check the result:
```bash
kubectl get deployments -n dev
kubectl get pods -n dev
```


You should see 3 pods with names like `nginx-deployment-xxxxx-yyyyy`.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-52/images/Screenshot%202026-03-20%20213111.png)

**Verify:** What do the READY, UP-TO-DATE, and AVAILABLE columns mean in the deployment output?

