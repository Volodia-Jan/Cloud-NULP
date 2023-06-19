module "label_authors" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  context  = var.context
  name     = var.name
}

module "label_courses" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  context  = var.context
  name     = var.name_courses
}

module "label_courses_save" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  context  = var.context
  name     = var.name_courses_save
}

module "label_courses_get" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  context  = var.context
  name     = var.name_courses_get
}

module "label_courses_update" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  context  = var.context
  name     = var.name_courses_update
}

module "label_courses_delete" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  context  = var.context
  name     = var.name_courses_delete
}

module "lambda_authors" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.13.0"
  function_name = module.label_authors.id
  description = "get-all-authors"
  handler = "index.handler"
  runtime = "nodejs12.x"
  source_path = "${path.module}/lambda_src/get_all_authors/index.js"
  
  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  create_role = false
  lambda_role = var.lambda_authors_role_arn

  tags = module.label_authors.tags
}

module "lambda_courses" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.13.0"
  function_name = module.label_courses.id
  description = "get-all-courses"
  handler = "index.handler"
  runtime = "nodejs12.x"
  source_path = "${path.module}/lambda_src/get_all_courses/index.js"
  
  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  create_role = false
  lambda_role = var.lambda_courses_role_arn

  tags = module.label_courses.tags
}

module "lambda_courses_save" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.13.0"
  function_name = module.label_courses_save.id
  description = "save-course"
  handler = "index.handler"
  runtime = "nodejs12.x"
  source_path = "${path.module}/lambda_src/save_course/index.js"
  
  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  create_role = false
  lambda_role = var.lambda_courses_role_arn
  
  tags = module.label_courses_save.tags
}

module "lambda_courses_get" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.13.0"
  function_name = module.label_courses_get.id
  description = "get-course"
  handler = "index.handler"
  runtime = "nodejs12.x"
  source_path = "${path.module}/lambda_src/get_course/index.js"
  
  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  create_role = false
  lambda_role = var.lambda_courses_role_arn

  tags = module.label_courses_get.tags
}

module "lambda_courses_delete" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.13.0"
  function_name = module.label_courses_delete.id
  description = "delete-course"
  handler = "index.handler"
  runtime = "nodejs12.x"
  source_path = "${path.module}/lambda_src/delete_course/index.js"
  
  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  create_role = false
  lambda_role = var.lambda_courses_role_arn

  tags = module.label_courses_delete.tags
}

module "lambda_courses_update" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.13.0"
  function_name = module.label_courses_update.id
  description = "update-course"
  handler = "index.handler"
  runtime = "nodejs12.x"
  source_path = "${path.module}/lambda_src/update_course/index.js"
  
  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  create_role = false
  lambda_role = var.lambda_courses_role_arn

  tags = module.label_courses_update.tags
}
