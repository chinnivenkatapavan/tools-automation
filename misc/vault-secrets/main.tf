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
      frontend = {
        catelogue_endpoint = "http://catalogue-dev.azdevops2704.online:8080"
        user_endpoint = "http://user-{{ ENV }}.azdevops2704.online:8080"
        cart_endpoint = "http://cart-{{ ENV }}.azdevops2704.online:8080"
        payment_endpoint = "http://payment-{{ ENV }}.azdevops2704.online:8080"
        shipping_endpoint = "http://shipping-{{ ENV }}.azdevops2704.online:8080"
      }
    }
  }
}

