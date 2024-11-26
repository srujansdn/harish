resource "aws_dynamodb_table" "dynamodb-terraform-lock-squad06" {
   name = "terraform-lock-squad06"
   hash_key = "LockID"
   read_capacity = 20
   write_capacity = 20

   attribute {
      name = "LockID"
      type = "S"
   }

   tags = {
     Name = "Terraform Lock Table"
   }
}