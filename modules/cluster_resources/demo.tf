# resource "rancher_environment" "demo" {
#   name = "blog-demo"
#   description = "Demonstration environment"
#   orchestration = "cattle"
# }

# resource "rancher_registration_token" "demo-token" {
#   environment_id = "${rancher_environment.demo.id}"
#   name = "demo-token"
#   description = "Host registration token for Demo environment"
# }