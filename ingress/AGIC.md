# AGIC

## What is AGIC

- Application Gateway Ingress Controller
- L7 load-balancer to expose cloud software to the Internet
- AGIC talks to pods using their private IP address directly and doesn't require NodePort or KubeProxy services
- react in response to an increase or decrease in traffic load and scale accordingly
- Can be deploy using [helm] () or enable adds-on using [azure cli] ()
- Follow round robin mechnaism

## Advantage of AGIC

- URL routing
- Cookie-based affinity
- TLS termination
- End-to-end TLS
- Support for public, private, and hybrid web sites
- Integrated web application firewall

## Componnets of AGIC

- 
