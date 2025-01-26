resource "vault_mount" "main" {
  for_each    = var.secrets
  path        = each.key
  type        = "kv"
  options     = { version = "1" }
  description = each.key
}

resource "vault_kv_secret" "secret" {
  path = "infra/ssh"
  data_json = jsonencode(var.secrets["infra"].ssh)
}

variable "secrets" {
  default = {
    infra = {
      shh = {
        admin_username = "pavan-roboshop",
        admin_password = "Devops@123456"
      }
    }
    roboshop-dev = {}
  }
}

