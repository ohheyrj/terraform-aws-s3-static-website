resource "aws_acm_certificate" "cert" {
  provider = acm

  domain_name       = var.domain_name
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "cert_validation" {
  provider                = acm
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.ohheyrj_co_uk_cert_route53 : record.fqdn]
}