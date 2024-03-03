resource "ssh_resource" "install_k3s" {
  for_each = local.servers
  host     = each.value.host
  user     = each.value.user
  agent    = true
  commands = [
    "sudo -A curl -sfL ${local.k3s.download_url} | INSTALL_K3S_VERSION='${local.k3s.version}' sh -s - server --docker --write-kubeconfig-mode 644 --disable=traefik"
    # TODO: For HA k3s cluster setup
    # "curl -sfL ${local.k3s.download_url} | INSTALL_K3S_VERSION='${local.k3s.version}' sh -s - server --cluster-init --docker --write-kubeconfig-mode 644 --disable=traefik"
  ]
  # private_key = file(each.value.private_key)
  timeout = "2m"
}

# resource "ssh_resource" "install_docker" {
#   for_each = local.servers
#   host     = each.value.host
#   user     = each.value.user
#   agent    = true
#   commands = [
#     "curl -fsSL https://get.docker.com | sh"
#     "apt install containerd -y",
#     "apt install -y docker.io docker-compose"
#   ]
#   timeout = "5m"
# }


# resource "ssh_resource" "install_docker" {
#   for_each    = { for server in var.servers : server.host => server }
#   host        = each.value.host
#   when        = "destroy"
#   user        = each.value.user
#   commands = [
#     "apt-get remove docker docker-engine docker.io containerd runc",
#     "apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose"
#     "rm -rf /etc/bash_completion.d/docker /usr/local/bin/docker-compose /etc/bash_completion.d/docker-compose"
#  ]
#   agent = true
#   timeout = "5m"
# }

# Note: Removed waiting for k3s server to be ready

resource "ssh_resource" "uninstall_k3s" {
  for_each    = { for server in var.servers : server.host => server }
  host        = each.value.host
  when        = "destroy"
  user        = each.value.user
  commands    = ["bash -c 'k3s-killall.sh; k3s-uninstall.sh;'"]
  # private_key = file(each.value.private_key)
  agent = true

}
