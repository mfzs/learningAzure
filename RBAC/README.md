# RBAC

## Introduction

- **Subjects:** User or Resources which need access to K8s APIs
- **APIGroups & Resources:** Objects that we grant access to
  - core, extensions, apps, batch, Pods, Deployments, services, SFS, DS.
- **Verbs:** List of action can be taken on resources
  - Create, List, Watch, Delete, Patch, Get, Replace, Read
- **RoleBinding:** is used to tie the Role and Subject together.
- to get azure cluster ID

```kubectl
az aks show \
--resource-group $resource-group \
--name $name \
--query id -o tsv
```

- to craete a Azure AD group

```kubectl
az aks create \
--display-name $groupidName \
--mail-nickname $groupidName \
--query objectId -o tsv 
```

- to create Role assignment

```kubectl
az role assignment create \
--assignee $groupID \
--role "Azure cluster Role" \
--scope $azureClusterID
```

- Create a user

```kubectl
az add user create \
--display-name $userName \
--user-principle-name $userName@<azurespecificNamingconvention> \
--password $password \
--query objectId -o tsv
```

- map user to a group

```kubectl
az add group member add \
--group $groupidName \
--member-id $userO bjectId
```
