variable "bucket_encryption" {
  description = "If bucket encryption should be enabled (Default: true)"
  default     = true
}

variable "bucket_encryption_key" {
  description = "Bucket Encryption Key to use (Default: aws/kms)"
  default     = null
}

variable "sse_algorithm" {
  description = "SSE Algorithm for bucket (AES256 or aws:kms Default: AES256 )"
  default     = "AES256"
}

variable "use_site_url" {
  description = "Use the static website URL instead of the bucket name. (Default: true)"
  default = true
}