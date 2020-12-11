output "bucket_arn" {
    value = aws_s3_bucket.bucket.id
    description = "The bucket created to host the static website."
}