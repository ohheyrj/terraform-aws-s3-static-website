provider "aws" {
  version = "3.18.0"
  region = var.region
}

provider "aws" {
  version = "3.18.0"
  alias = "acm"
  region = "us-east-1"
}

variable "region" {
    type = string
    description = "Region for bucket and cloudfront."
}

variable "domain_name" {
  type        = string
  description = "The domain of the static website."
}

variable "zone_id" {
  type        = string
  description = "The zone ID for the domain name."
}

variable "index_document" {
  type        = string
  default     = "index.html"
  description = "The default index document. Also the index document of cloudfront."
}

variable "error_document" {
  type        = string
  default     = "error.html"
  description = "The default error document."
}
