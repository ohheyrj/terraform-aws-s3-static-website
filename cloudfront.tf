resource "aws_cloudfront_distribution" "cfd_site_url" {
  origin {
    domain_name = aws_s3_bucket.bucket.website_endpoint
    origin_id   = "S3-${aws_s3_bucket.bucket.bucket}"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
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
  count = var.use_site_url ? 1 : 0
}

resource "aws_cloudfront_distribution" "cfd" {
  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
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
  count = var.use_site_url ? 0 : 1
}