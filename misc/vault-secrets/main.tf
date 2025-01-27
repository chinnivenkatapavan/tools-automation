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
        user_endpoint = "http://user-dev.azdevops2704.online:8080"
        cart_endpoint = "http://cart-dev.azdevops2704.online:8080"
        payment_endpoint = "http://payment-dev.azdevops2704.online:8080"
        shipping_endpoint = "http://shipping-dev.azdevops2704.online:8080"
      }
      catalogue = {
        MONGO = "true"
        MONGO_URL = "mongodb://mongodb-dev.azdevops2704.online:27017/catalogue"
      }
      user = {
        MONGO=true
        REDIS_URL = "redis://redis-dev.azdevops2704.online:6379"
        MONGO_URL = "mongodb://mongodb-dev.azdevops2704.online:27017/users"
      }
      cart = {
        REDIS_HOST = "redis-dev.azdevops2704.online"
        CATALOGUE_HOST = "catalogue-dev.azdevops2704.online"
        CATALOGUE_PORT = "8080"
      }
      payment = {
        CART_HOST = "cart-DEV.azdevops2704.online"
        CART_PORT = "8080"
        USER_HOST = "user-dev.azdevops2704.online"
        USER_PORT = "8080"
        AMQP_HOST = "rabbitmq-dev.azdevops2704.online"
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
      }
      mysql = {
        MYSQL_ROOTUSER = "RoboShop@1"
      }
      rabbitmq = {
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"

      }
    }
  }
}

