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

  # backend "http" {
  #   # address = "http://localhost:6061/?type=git&repository=https://github.com/wischmcj/tf-state&ref=master&state=my/state.json"
  #   # lock_address = "http://localhost:6061/?type=git&repository=https://github.com/wischmcj/tf-state&ref=master&state=my/state.json"
  #   # unlock_address = "http://localhost:6061/?type=git&repository=https://github.com/wischmcj/tf-state&ref=master&state=my/state.json"
  #   address = "http://localhost:6061/?type=git&repository=https://github.com/wischmcj/tf-state&ref=master&state=my/state.json"
  #   lock_address = "http://localhost:6061/?type=git&repository=https://github.com/wischmcj/tf-state&ref=master&state=my/state.json"
  #   unlock_address = "http://localhost:6061/?type=git&repository=https://github.com/wischmcj/tf-state&ref=master&state=my/state.json"
  #   username="wischmcj"
  #   password="Gamma@13"
  # }
}

provider "ssh" {}
provider "time" {}
provider "remote" {}
