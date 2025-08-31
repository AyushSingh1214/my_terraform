# S3 bucket for storing tfstate
# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "my-terraform-state-ayush"   # must be globally unique
#   acl    = "private"

#   versioning {
#     enabled = true
#   }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

# #   lifecycle {
# #     prevent_destroy = true
# #   }
# }

# # DynamoDB table for state locking
# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket         = "my-terraform-state-ayush"   # same bucket you created
#     key            = "global/terraform.tfstate"   # path inside the bucket
#     region         = "us-east-1"                 # change to your AWS region
#     dynamodb_table = "terraform-locks"            # DynamoDB table name
#     encrypt        = true
#   }
# }
