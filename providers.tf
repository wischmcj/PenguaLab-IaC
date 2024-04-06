terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  #local on server
  # host = "tcp://localhost:2375"
  #remote
  # host = "unix:///run/user/1000/docker.sock"
  host     = "ssh://wischmcj@192.168.0.94:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]

}
