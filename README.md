Overview:

A minimal version (more robust than a template, less than the production version) for configuration of cluster nodes within a local network.
Used to configure nodes for and deploy apps to within my 'Homelab' (various applications that I host locally for private use).

Hardware:

PenguaPi - RasberryPi 4B (ARM)

PenguaLibre - LibrePi Le Potato (x64)

PenguaSaur - Lenovo Y70 (x64) 

Software: 

/modules: Creates K3s cluster managed by Rancher
- Collectively my 'Homelab'. Runs:
  - CoreDNS
  - PiHole
  - Loki
  - Argo
  - Graphana
  - Mino
- Packages managed using Helm

Everthing outside of '/modules': Snippets for deploying docker containers to nodes
- Ubuntuserver: minimal bash commands for node server configuration
  - Docker non-root user config - needed to avoid giving root privileges to terraform user
  - lib-pam-ssh - facilitates limited passwordless sudo commands via ssh
- /ansible/
  - In progress: defines a minimal LAN with a load balancer
- ./*.tf - Terraform files
  - main.tf - creates mariadb (mySql) in instance on each cluster, configures nginx as load balancer, snippets for general docker image deployment
  - variables.tf - notably: mySql creds, volumes on each node


** Note that the code in this repository (even a few full files) are sourced from a variety of K3s, Docker, Terraform etc. tutorials **
<<TODO: Add links to tutorials>>>
