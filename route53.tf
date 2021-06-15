resource "aws_route53_record" "alias_record" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.use_site_url ? aws_cloudfront_distribution.cfd_site_url[count.index].domain_name : aws_cloudfront_distribution.cfd[count.index].domain_name
    zone_id                = var.use_site_url ? aws_cloudfront_distribution.cfd_site_url[count.index].hosted_zone_id : aws_cloudfront_distribution.cfd[count.index].hosted_zone_id
    evaluate_target_health = false
  }
}