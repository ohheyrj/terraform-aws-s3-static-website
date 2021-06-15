resource "aws_route53_record" "alias_record" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.use_site_url ? aws_cloudfront_distribution.cfd_site_url[0].domain_name : aws_cloudfront_distribution.cfd[0].domain_name
    zone_id                = var.use_site_url ? aws_cloudfront_distribution.cfd_site_url[0].hosted_zone_id : aws_cloudfront_distribution.cfd[0].hosted_zone_id
    evaluate_target_health = false
  }
}