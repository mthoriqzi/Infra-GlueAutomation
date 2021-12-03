terraform{
  backend "s3" {
    bucket = "terraform-backend"
    key = "dev_${var.glue_database}_prod/terraform_state"
    region = "ap-southeast-1"
  }
}
