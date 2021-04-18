output "s3_bucket_name" {
  value       = aws_s3_bucket.bucket.id
  description = "Name of S3 bucket for static website."
}