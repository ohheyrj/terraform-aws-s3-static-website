resource "aws_cloudfront_distribution" "cfd" {
  origin {
    domain_name = var.use_site_url ? aws_s3_bucket.bucket.website_endpoint : aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = "S3-${aws_s3_bucket.bucket.bucket}"
  }
  aliases             = [var.domain_name]
  enabled             = true
  default_root_object = var.index_document


  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    viewer_protocol_policy = "redirect-to-https"
    target_origin_id       = "S3-${aws_s3_bucket.bucket.bucket}"
    cached_methods         = ["GET", "HEAD"]
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = var.cert_arn
    ssl_support_method  = "sni-only"
  }
}