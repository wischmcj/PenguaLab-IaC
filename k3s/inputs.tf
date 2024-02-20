variable "servers" {
  description = "machines which will run the control plane"
  type = list(object({
    host = string
    user = string
    private_key = string
  }))
  default = []
}

variable "k3s" {
  type = object({
    download_url = optional(string),
    version = optional(string),
  })
  default = {}
}

# variable "TF_VAR_admin_username" {
#     type = string
# }

# variable "TF_VAR_admin_password" {
#     type = string
# }