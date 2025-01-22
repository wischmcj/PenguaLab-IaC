A minimal template (perhaps even skeleton) for configuration of cluster nodes within a local network.

Modules: Creates K3s cluster managed by Rancher
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
- Ansible: not much now, other than configuring the lan
- Terraform:
  - main.tf - creates mariadb (mySql) in instance on each cluster, configures nginx as load balancer, snippets for general docker image deployment
  - variables.tf - notably: mySql creds, volumes on each node

