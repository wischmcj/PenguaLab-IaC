terraform {
  required_version = ">=1.3.0"

  required_providers {
    ssh = {
      source  = "loafoe/ssh"
      version = "2.3.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }

    remote = {
      source  = "tenstad/remote"
      version = "0.1.1"
    }
  }

}

provider "ssh" {}
provider "time" {}
provider "remote" {}

# provider "docker" {
#   # host = "unix:///run/user/1000/docker.sock"
#   host     = "ssh://wischmcj@192.168.0.94:22"
#   ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]

# }