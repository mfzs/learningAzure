# AZURE CNI

## Azure Container Networking Interface (CNI)

- It assigns VNet IP address to every pod from a pre-reserved set of IPs on every node or a separate subnet reserved for pods
- The Overlay solution assigns a /24 address space for pods on every node from the private CIDR that you specify during cluster creation. The /24 size is fixed and can't be increased or decreased
- Max 250 Pods/Node and configured min is 10
- Azure CNI offers two IP addressing options for pods
  - traditional configuration that assigns VNet IPs to pods
  - You would like to scale to a large number of pods, but have limited IP address space in your VNet.
  - Most of the pod communication is within the cluster.
  - You don't need advanced AKS features, such as virtual nodes.
- Overlay networking
  - You have available IP address space.
  - Most of the pod communication is to resources outside of the cluster.
  - Resources outside the cluster need to reach pods directly.
  - You need AKS advanced features, such as virtual nodes.
**Limitations of Azure CNI**
- You can't use Application Gateway as an Ingress Controller (AGIC) for an Overlay cluster.
- You can't use Application Gateway for Containers for an Overlay cluster.
- Virtual Machine Availability Sets (VMAS) aren't supported for Overlay.

**Comparision Table**

| Area                         | Azure CNI Overlay                                     | Kubenet                                          |
|------------------------------|------------------------------------------------------|--------------------------------------------------|
| Cluster scale                | 5000 nodes and 250 pods/node                         | 400 nodes and 250 pods/node                      |
| Network configuration        | Simple - no extra configurations required for pod networking | Complex - requires route tables and UDRs on cluster subnet for pod networking |
| Pod connectivity performance | Performance on par with VMs in a VNet                | Extra hop adds latency                           |
| Kubernetes Network Policies  | Azure Network Policies, Calico, Cilium               | Calico                                           |
| OS platforms supported       | Linux and Windows Server 2022, 2019                  | Linux only                                       |
