terraform {
    backend "s3" {
        bucket = "s3backend.id"
        key = "hackathonsquad6/terraformstatefile"
        region = "us-east-1"
        dynamodb_table = "terraform-lock-squad06"
    }
}
