
# Creating a Docker Image ubuntu with the latest as the Tag.
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}


# resource "docker_volume" "data" {
#   count = var.create_data_volume ? 1 : 0

#   name        = local.data_volume_name
#   driver      = var.data_volume_driver
#   driver_opts = var.data_volume_driver_opts

#   dynamic "labels" {
#     for_each = var.labels
#     iterator = label
#     content {
#       label = label.key
#       value = label.value
#     }
#   }
# }


# Creating a Docker Container using the latest ubuntu image.
resource "docker_container" "webserver" {
  name = "wsu_pi"
  # name  = var.webserver_ubuntu__container_name
  image             = docker_image.ubuntu.image_id
  must_run          = true
  publish_all_ports = true
  command = [
    "tail",
    "-f",
    "/dev/null"
  ]
}


resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name = "nginx_pi"
  # name  = var.nginx_container_name
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_image" "mariadb" {
  #need older version to run on Arm v7
  name         = "yobasystems/alpine-mariadb"
  keep_locally = false
}

# resource "docker_container" "mariadb" {
#   name = "mariadb_pi"
#   # name  = var.nginx_container_name
#   image = docker_image.mariadb.image_id
#   restart = "always"
#   env = [
#     "MYSQL_ROOT_PASSWORD = Alpha@Romeo@13"
#     ,"MYSQL_DATABASE = penguasql"
#     ,"MYSQL_USER = wischmcj"
#     ,"MYSQL_PASSWORD = Alpha@Romeo@13"
#   ] 
#   mounts = {
#     target = "/var/lib/mysql"
#     type = "bind"
#   }
#   ports = {
#     internal="3306"
#     external= "${variables.mysql_port}"
#   }
# }

resource "docker_container" "db" {
  name = "mariadb_pi"
  image = docker_image.mariadb.image_id
  restart = "always"
  # network_mode = "wordpress_net"
  env = [
     "MYSQL_ROOT_PASSWORD=wordpress",
     "MYSQL_PASSWORD=wordpress",
     "MYSQL_USER=wordpress",
     "MYSQL_DATABASE=wordpress"
  ]
  mounts {
    type = "volume"
    target = "/var/lib/mysql"
    source = "db_data"
  }

  # mounts = {
  #   "type = volume"
    # ,"target = /var/lib/mysql"
    # ,"source = db_data"
  # }
}
# resource "docker_volume" "maria_db_volume" {
#   name = "shared_volume"
# }

# resource "docker_network" "private_network" {
#   name = "penguaworks"
# }

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