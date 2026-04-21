1. Install Helm (brew, curl script, or chocolatey depending on your OS)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-20%20234441.png)

2. Verify with `helm version` and `helm env`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20000609.png)

Three core concepts:
- **Chart** — a package of Kubernetes manifest templates
- **Release** — a specific installation of a chart in your cluster
- **Repository** — a collection of charts (like a package repo)

**Verify:** What version of Helm is installed?
   v4.1.4

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-20%20234701.png)

---

### Task 2: Add a Repository and Search
1. Add the Bitnami repository: `helm repo add bitnami https://charts.bitnami.com/bitnami`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20001107.png)

2. Update: `helm repo update`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20001301.png)
   
3. Search: `helm search repo nginx` and `helm search repo bitnami`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20001516.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20001830.png)

**Verify:** How many charts does Bitnami have?
  - 144

  ---
  
### Task 3: Install a Chart
1. Deploy nginx: `helm install my-nginx bitnami/nginx`

  ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20002447.png)


2. Check what was created: `kubectl get all`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20002729.png)

3. Inspect the release: `helm list`, `helm status my-nginx`, `helm get manifest my-nginx`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20003141.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20003320.png)

One command replaced writing a Deployment, Service, and ConfigMap by hand.

**Verify:** How many Pods are running? What Service type was created?

  - One Pod is running and LoadBalancer service type was created.

---

1. View defaults: `helm show values bitnami/nginx`


2. Install a custom release with `--set replicaCount=3 --set service.type=NodePort`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20010842.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20011638.png)

3. Create a `custom-values.yaml` file with replicaCount, service type, and resource limits

4. Install another release using `-f custom-values.yaml`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20013201.png)


5. Check overrides: `helm get values <release-name>`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20013451.png)

**Verify:** Does the values file release have the correct replicas and service type?
  Yes
  
---

### Task 5: Upgrade and Rollback
1. Upgrade: `helm upgrade my-nginx bitnami/nginx --set replicaCount=5`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20014743.png)

2. Check history: `helm history my-nginx`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20014945.png)

3. Rollback: `helm rollback my-nginx 1`
4. Check history again — rollback creates a new revision (3), not overwriting revision 2

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20015121.png)

Same concept as Deployment rollouts from Day 52, but at the full stack level.

**Verify:** How many revisions after the rollback?
   There are three revisions after rollback.



---


### Task 6: Create Your Own Chart
1. Scaffold: `helm create my-app`
2. Explore the directory: `Chart.yaml`, `values.yaml`, `templates/deployment.yaml`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20172038.png)


3. Look at the Go template syntax in templates: `{{ .Values.replicaCount }}`, `{{ .Chart.Name }}`
4. Edit `values.yaml` — set replicaCount to 3 and image to nginx:1.25
5. Validate: `helm lint my-app`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20173554.png)

6. Preview: `helm template my-release ./my-app`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20180121.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20180328.png)

7. Install: `helm install my-release ./my-app`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20182215.png)

8. Upgrade: `helm upgrade my-release ./my-app --set replicaCount=5`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20183046.png)

**Verify:** After installing, 3 replicas? After upgrading, 5?

After installing 

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20182935.png)


After upgrading

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20183427.png)

---
### Task 7: Clean Up
1. Uninstall all releases: `helm uninstall <name>` for each

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20183755.png)

2. Remove chart directory and values file

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20184429.png)

3. Use `--keep-history` if you want to retain release history for auditing

**Verify:** Does `helm list` show zero releases?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-59/images/Screenshot%202026-04-21%20184114.png)
