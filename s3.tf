resource "aws_s3_bucket" "bucket" {
  bucket = var.domain_name
  acl    = "public-read"

  website {
    index_document = var.index_document
    error_document = var.error_document
  }
}