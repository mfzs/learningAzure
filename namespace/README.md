# Namespcae

## What is namespace ?

- Namespace is a sort of isolation which helps in isolation of one tenants/env to another.
- It helps in RBAC, Scopes, QuotaManagemnet
- By deyault containers run without any limit, So we can restrict them using namespace limit
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

## Limit Range

- provides how max and min resource can be used in a namespace
- When we apply [LimitRange](./nameSpaceQuota.yaml) it will automatically applied to all container under this particular namespace.
- If defaultRequests is not defined then it will take default values as defaultRequests.
- If default values is not define then it will took 1 cpu and 512Mi by deafult.
