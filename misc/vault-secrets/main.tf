module "create-secrets" {
  for_each = var.secrets
  source = "./create-secrets"
  kv_path = each.key
  secrets = each.value

}


variable "secrets" {
  default = {
    infra = {
      ssh = {
        admin_username = "pavan-roboshop",
        admin_password = "Devops@123456"
      }
    }
    roboshop-dev = {
      frontend = {}
      catalogue = {}
    }
  }
}

