terraform {
  required_version = ">=1.3.0"

  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.6.0"
    }

    k8s = {
      source = "hashicorp/kubernetes"
      version = "2.12.0"
    }

    # rancher = {
    #   source = "terraform-providers/rancher2"
    # }


    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

  # backend "http" { }
}

# provider "rancher" {
#   api_url = "http://wischmcj:192.168.0.94:22" //
#   access_key = "" //
#   secret_key = ""
# }

provider "docker" {
  host     = "ssh://wischmcj@192.168.0.94:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]

}

provider "helm" {
  kubernetes {
    config_path = var.cluster.config_path
  }
}

provider "k8s" {
  config_path = var.cluster.config_path
  config_context = var.cluster.name
}

