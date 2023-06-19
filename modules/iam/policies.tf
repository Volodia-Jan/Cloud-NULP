data "aws_iam_policy_document" "table_courses" {
  statement {
    actions = [
      "dynamodb:Scan",
      "dynamodb:GetItem",
      "dynamodb:PutItem", 
      "dynamodb:UpdateItem",
      "dynamodb:DeleteItem"
    ]

    resources = [
      var.table_courses_arn
    ]
  }
}

resource "aws_iam_policy" "table_courses" {
  name   = module.label_table_courses.id
  path   = "/"
  policy = data.aws_iam_policy_document.table_courses.json

}

data "aws_iam_policy_document" "table_authors" {
  statement {
    actions = [
      "dynamodb:Scan"
    ]

    resources = [
      var.table_authors_arn
    ]
  }
}

resource "aws_iam_policy" "table_authors" {
  name   = module.label_table_authors.id
  path   = "/"
  policy = data.aws_iam_policy_document.table_authors.json

}