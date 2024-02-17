

resource "docker_volume" "data" {
  count = var.create_data_volume ? 1 : 0

  name        = local.data_volume_name
  driver      = var.data_volume_driver
  driver_opts = var.data_volume_driver_opts

  dynamic "labels" {
    for_each = var.labels
    iterator = label
    content {
      label = label.key
      value = label.value
    }
  }
}

resource "docker_network" "private_network" {
  name = "penguaworks"
}

# node should be a swarm manager. Use "docker swarm init" or "docker swarm join" to connect
#resource "docker_secret" "foo" {
#  name = "foo"
#  data = base64encode("{\"foo\": \"s3cr3t\"}")
#}


#The source image must exist on the machine running the docker daemon.
#resource "docker_tag" "tag" {
#  source_image = "xxxx"
#  target_image = "xxxx"
#}