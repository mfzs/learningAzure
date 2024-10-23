# Namespcae

## What is namespace ?

-  
- **to create Namespace using cli**

```kubectl
kubectl create ns namespaceName
```

- **to create Namespace using [file](./namespace.yaml)**

```kubectl
kubectl apply -f namespace.yaml
```

- **access container locally**

```localhost
<servicename>.<namespace>.svc.cluster.local
```
