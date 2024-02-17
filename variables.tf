variable "server_ip" {
  default = "192.168.0.94"
}

#volumes
variable "create_data_volume" {
  type        = bool
  description = "Create a volume for the '/var/lib/mysql' directory."
  default     = true
}

variable "data_volume_driver" {
  type        = string
  description = "Storage driver for the data volume."
  default     = "local"
}

variable "data_volume_driver_opts" {
  type        = map(any)
  description = "Storage driver options for the data volume."
  default     = {}
}


variable mysql_port {
  default = "3306"
}


# Terraform documentation
#  * Provisioner null_resource: https://www.terraform.io/docs/provisioners/null_resource.html
#  * Provisioner Connections: https://www.terraform.io/docs/provisioners/null_resource.html
