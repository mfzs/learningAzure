# AZURE CNI

## Azure Container Networking Interface (CNI)

    - It assigns VNet IP address to every pod from a pre-reserved set of IPs on every node or a separate subnet reserved for pods
    - 

**Comparision Table**

| Area                         | Azure CNI Overlay                                     | Kubenet                                          |
|------------------------------|------------------------------------------------------|--------------------------------------------------|
| Cluster scale                | 5000 nodes and 250 pods/node                         | 400 nodes and 250 pods/node                      |
| Network configuration        | Simple - no extra configurations required for pod networking | Complex - requires route tables and UDRs on cluster subnet for pod networking |
| Pod connectivity performance | Performance on par with VMs in a VNet                | Extra hop adds latency                           |
| Kubernetes Network Policies  | Azure Network Policies, Calico, Cilium               | Calico                                           |
| OS platforms supported       | Linux and Windows Server 2022, 2019                  | Linux only                                       |
