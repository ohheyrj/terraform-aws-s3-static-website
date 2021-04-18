resource "aws_s3_bucket" "bucket" {
  bucket = var.domain_name
  acl    = "public-read"

  dynamic "server_side_encryption_configuration" {
    for_each = var.bucket_encryption ? [1] : []
    content {
      rule {
        apply_server_side_encryption_by_default {
          kms_master_key_id = var.bucket_encryption_key
          sse_algorithm     = var.sse_algorithm
        }
      }
    }
  }

  website {
    index_document = var.index_document
    error_document = var.error_document
  }
}