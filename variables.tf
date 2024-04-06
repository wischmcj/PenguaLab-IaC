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


# variable "mysql_root_password" {
#   type        = string
#   description = "MySQL root password."
#   default     = ""
#   sensitive   = true
# }

# variable "mysql_database" {
#   type        = string
#   description = "MySQL database name."
#   default     = ""
# }

# variable "mysql_user" {
#   type        = string
#   description = "Name of the user that should be created."
#   default     = ""
# }

# variable "mysql_password" {
#   type        = string
#   description = "Password of the user that should be created."
#   default     = ""
# }

# variable "mysql_allow_empty_password" {
#   type        = bool
#   description = "Whether an empty root password should be allowed or not."
#   default     = false
# }

# variable "mysql_random_root_password" {
#   type        = bool
#   description = "Whether to create a randomized password for the root user."
#   default     = false
# }

# variable "mysql_onetime_password" {
#   type        = bool
#   description = <<-DESCRIPTION
#   Set root user as expired after init, forcing a password change on first login.
#   DESCRIPTION
#   default     = false
# }

# variable "mysql_initdb_skip_tzinfo" {
#   type        = bool
#   description = "Disable timezone loading."
#   default     = false
# }

# variable "webserver_ubuntu__container_name" {
#   type        = string
#   description = "name of the container"
# }

# variable "nginx_container_name" {
#   type        = string
#   description = "name of the container"
# }

# variable redis_container_name" {
#   type        = string
#   description = "name of the container"
# }

# Terraform documentation
#  * Provisioner null_resource: https://www.terraform.io/docs/provisioners/null_resource.html
#  * Provisioner Connections: https://www.terraform.io/docs/provisioners/null_resource.html
