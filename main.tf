terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.18.0"
    }
  }
}

provider "aws" {
  alias = "acm"
  region = "us-east-1"
}

provider "acm" {
    region = "us-east-1"
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
