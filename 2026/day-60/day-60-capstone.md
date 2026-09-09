## Challenge Tasks

### Task 1: Create the Namespace (Day 52)
1. Create a `capstone` namespace
2. Set it as your default: `kubectl config set-context --current --namespace=capstone`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20124816.png)
---

### Task 2: Deploy MySQL (Days 54-56)
1. Create a Secret with `MYSQL_ROOT_PASSWORD`, `MYSQL_DATABASE`, `MYSQL_USER`, and `MYSQL_PASSWORD` using `stringData`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20124919.png)

2. Create a Headless Service (`clusterIP: None`) for MySQL on port 3306

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20130252.png)

3. Create a StatefulSet for MySQL with:
   - Image: `mysql:8.0`
   - `envFrom` referencing the Secret
   - Resource requests (cpu: 250m, memory: 512Mi) and limits (cpu: 500m, memory: 1Gi)
   - A `volumeClaimTemplates` section requesting 1Gi of storage, mounted at `/var/lib/mysql`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20130406.png)

4. Verify MySQL works: `kubectl exec -it mysql-0 -- mysql -u <user> -p<password> -e "SHOW DATABASES;"`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20130518.png)



**Verify:** Can you see the `wordpress` database?
Yes.

---

### Task 3: Deploy WordPress (Days 52, 54, 57)
1. Create a ConfigMap with `WORDPRESS_DB_HOST` set to `mysql-0.mysql.capstone.svc.cluster.local:3306` and `WORDPRESS_DB_NAME`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20131528.png)

2. Create a Deployment with 2 replicas using `wordpress:latest` that:
   - Uses `envFrom` for the ConfigMap
   - Uses `secretKeyRef` for `WORDPRESS_DB_USER` and `WORDPRESS_DB_PASSWORD` from the MySQL Secret
   - Has resource requests and limits
   - Has a liveness probe and readiness probe on `/wp-login.php` port 80

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20131642.png)

3. Wait until both pods show `1/1 Running`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20131728.png)

**Verify:** Are both WordPress pods running and ready?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20131746.png)

---

### Task 4: Expose WordPress (Day 53)
1. Create a NodePort Service on port 30080 targeting the WordPress pods

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20132238.png)

2. Access WordPress in your browser:
   - Minikube: `minikube service wordpress -n capstone`
   - Kind: `kubectl port-forward svc/wordpress 8080:80 -n capstone`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20133751.png)
   
3. Complete the setup wizard and create a blog post

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20132447.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20132530.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20133230.png)

**Verify:** Can you see the WordPress setup page?
Yes

---  

### Task 5: Test Self-Healing and Persistence
1. Delete a WordPress pod — watch the Deployment recreate it within seconds. Refresh the site.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20135425.png)

2. Delete the MySQL pod: `kubectl delete pod mysql-0 -n capstone` — watch the StatefulSet recreate it

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20135622.png)

3. After MySQL recovers, refresh WordPress — your blog post should still be there

**Verify:** After deleting both pods, is your blog post still there?
Yes

---

### Task 6: Set Up HPA (Day 58)
1. Write an HPA manifest targeting the WordPress Deployment with CPU at 50%, min 2, max 10 replicas

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20140200.png)

2. Apply and check: `kubectl get hpa -n capstone`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20140450.png)

3. Run `kubectl get all -n capstone` for the complete picture

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20140631.png)

**Verify:** Does the HPA show correct min/max and target?
Yes

---

### Task 7: (Bonus) Compare with Helm (Day 59)
1. Install WordPress using `helm install wp-helm bitnami/wordpress` in a separate namespace

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20143855.png)

2. Compare: how many resources did each approach create? Which gives more control?

Manual Approach gives us more control

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20142122.png) ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20140631.png)


| Resource Type      | Manual YAML (`capstone`)                 | Helm (`default`)                                             |
| ------------------ | ---------------------------------------- | --------------------------------------------------------------- |
| **Pods**           | 3 (2 WordPress + 1 MySQL)                | 2 (1 WordPress + 1 MariaDB)                                     |
| **Deployments**    | 1 (WordPress)                            | 1 (WordPress)                                                   |
| **StatefulSets**   | 1 (MySQL)                                | 1 (MariaDB)                                                     |
| **ReplicaSets**    | 1 (WordPress)                            | 1 (WordPress)                                                   |
| **Services**       | 2 (WordPress NodePort + MySQL ClusterIP) | 3 (WordPress LoadBalancer + MariaDB ClusterIP + headless)       |
| **HPA**            | 1 (WordPress CPU-based)                  | 0 (Not created by default)                                      |
| **ConfigMaps**     | 1 (`wordpress-config`)                   | 1 (`wp-helm-mariadb`)                                           |
| **Secrets**        | 1 (`mysql-secret`)                       | 3 (`wp-helm-mariadb`, `wp-helm-wordpress`, Helm release secret) |
| **PVCs / Storage** | 1 (`mysql-data-mysql-0`)                 | 2 (`data-wp-helm-mariadb-0`, `wp-helm-wordpress`)               |



3. Clean up the Helm deployment

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20144411.png)

---

### Task 8: Clean Up and Reflect
1. Take a final look: `kubectl get all -n capstone`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20140631.png)

2. Count the concepts you used: Namespace, Secret, ConfigMap, PVC, StatefulSet, Headless Service, Deployment, NodePort Service, Resource Limits, Probes, HPA, Helm — twelve concepts in one deployment
3. Delete the namespace: `kubectl delete namespace capstone`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20144937.png)

4. Reset default: `kubectl config set-context --current --namespace=default`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-60/images/Screenshot%202026-09-09%20145049.png)


**Verify:** Did deleting the namespace remove everything?

Yes , deleting namespace deleted every resource created.
---

