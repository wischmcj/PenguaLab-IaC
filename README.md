A minimal template (perhaps even skeleton) for configuration of cluster nodes within a local network.

Features:
- Snippets for deploying docker containers to nodes
- Ubuntuserver: minimal bash commands for node server configuration
  - Docker non-root user config - needed to avoid giving root privileges to terraform user
  - lib-pam-ssh - facilitates limited passwordless sudo commands via ssh
- Ansible: not much now, other than configuring the lan
- 
