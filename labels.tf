module "labels" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace   = var.namespace
  environment = var.environment
  delimiter   = var.delimiter
}

module "label_api" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  name    = "api"
  context = module.labels.context
}