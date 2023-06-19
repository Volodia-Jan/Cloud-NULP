output "table_name" {
    value = aws_dynamodb_table.db.id

}
output "table_arn" {
    value = aws_dynamodb_table.db.arn
}