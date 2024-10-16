# Architecture

## Master Node

- **Container Runtime**
- **etcd**
  - Database; stores data in key-value format
  - Stores all worker and master node data/information
- **kube-scheduler**
  - Distributes load across worker nodes
  - Schedules the node according to resource availability
- **kube-apiserver**
  - Front end of the cluster
  - Exposes all Kubernetes (k8s) APIs
  - Manages API requests
- **kube-controller-manager**
  - Monitors cluster state and maintains desired state
  - **Node Controller**: Manages nodes and handles failures
  - **Replication Controller**: Maintains the required number of replicas of a pod
  - **Endpoint Controller**: Populates the endpoints
  - **Service Account and Token Controller**: Creates default accounts and API access for new namespaces
  - **Cloud Controller**: Handles cloud-specific tasks
  - **Route Controller**: Sets up routing
  - **Service Controller**: Manages cloud load balancers (create/update/delete)

## Worker Node

- **Container Runtime**: e.g., Docker
- **kubelet:**
  *agent runs on worker node
  *
- **kube-proxy:**
    - network proxy
    - maintains network rules
    - helps in intra - inter pod communication