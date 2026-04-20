## Challenge Tasks

### Task 1: Install the Metrics Server
1. Check if it is already running: `kubectl get pods -n kube-system | grep metrics-server`
2. If not, install it:
   - Minikube: `minikube addons enable metrics-server`
   - Kind/kubeadm: apply the official manifest from the metrics-server GitHub releases
4. On local clusters, you may need the `--kubelet-insecure-tls` flag (never in production)

   ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20164605.png)

5. Wait 60 seconds, then verify: `kubectl top nodes` and `kubectl top pods -A`

 **Verify:** What is the current CPU and memory usage of your node?
 
   ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20165020.png)

---

### Task 2: Explore kubectl top
1. Run `kubectl top nodes`, `kubectl top pods -A`, `kubectl top pods -A --sort-by=cpu`

 ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20165020.png)

 ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20175647.png)

2. `kubectl top` shows real-time usage, not requests or limits — these are different things
3. Data comes from the Metrics Server, which polls kubelets every 15 seconds

**Verify:** Which pod is using the most CPU right now?
  kube-apiserver-sam-cluster-control-plane (CPU-82m, Memory -248Mi)

---

### Task 3: Create a Deployment with CPU Requests
1. Write a Deployment manifest using the `registry.k8s.io/hpa-example` image (a CPU-intensive PHP-Apache server)
2. Set `resources.requests.cpu: 200m` — HPA needs this to calculate utilization percentages
3. Expose it as a Service: `kubectl expose deployment php-apache --port=80`

Without CPU requests, HPA cannot work — this is the most common HPA setup mistake.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20183630.png)

**Verify:** What is the current CPU usage of the Pod?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20183310.png)



---
### Task 4: Create an HPA (Imperative)
1. Run: `kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10`
2. Check: `kubectl get hpa` and `kubectl describe hpa php-apache`
3. TARGETS may show `<unknown>` initially — wait 30 seconds for metrics to arrive


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20191732.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20192222.png)


This scales up when average CPU exceeds 50% of requests, and down when it drops below.

**Verify:** What does the TARGETS column show?
  cpu: 0%/50%
---


---

### Task 5: Generate Load and Watch Autoscaling
1. Start a load generator: `kubectl run load-generator --image=busybox:1.36 --restart=Never -- /bin/sh -c "while true; do wget -q -O- http://php-apache; done"`
2. Watch HPA: `kubectl get hpa php-apache --watch`
3. Over 1-3 minutes, CPU climbs above 50%, replicas increase, CPU stabilizes


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20194635.png)

4. Stop the load: `kubectl delete pod load-generator`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20194814.png)

5. Scale-down is slow (5-minute stabilization window) — you do not need to wait

**Verify:** How many replicas did HPA scale to under load?
  It scaled to 10 pods the maximum limit under load.


  ---

  
### Task 6: Create an HPA from YAML (Declarative)
1. Delete the imperative HPA: `kubectl delete hpa php-apache`
2. Write an HPA manifest using `autoscaling/v2` API with CPU target at 50% utilization
3. Add a `behavior` section to control scale-up speed (no stabilization) and scale-down speed (300 second window)
4. Apply and verify with `kubectl describe hpa`

`autoscaling/v2` supports multiple metrics and fine-grained scaling behavior that the imperative command cannot configure.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20213939.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-58/images/Screenshot%202026-04-20%20214058.png)

**Verify:** What does the `behavior` section control?
     It controls the scaling up and scaling down Policies 
