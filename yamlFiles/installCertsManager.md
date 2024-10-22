# Letsencupt

## Commands to install

- kubectl label namespace <namespaceName> cert-manager-io/disable-validation=true
- helm repo add jetstack https://charts.jetsactk.io
- helm repo update
- helm install \
    cert-manager jetstack/cert-manager \
    --namespace <namespaceName> \
    --version v1.8.2
    --set installCRDs=true

