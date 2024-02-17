
# output "data_volume_name" {
#   description = <<-DESCRIPTION
#   Name of the data volume.
#   If 'create_data_volume' is set to 'false' this output will hold an empty string.
#   DESCRIPTION
#   value       = var.create_data_volume ? docker_volume.data[0].name : ""
# }

# output "this_network_data" {
#   description = <<-DESCRIPTION
#   Network configuration of the container. This exports the 'network_data' attribute of the docker
#   container, check the docker provider (kreuzwerker/docker) for more info.
#   DESCRIPTION
#   value       = docker_container.this.network_data
# }

# output "this_uuid" {
#   description = "The random uuid used for naming the resources created by this module."
#   value       = local.uuid
# }