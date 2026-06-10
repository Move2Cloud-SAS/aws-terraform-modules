####### Origin Access Control (modern replacement for OAI) #######

resource "aws_cloudfront_origin_access_control" "OAC" {
  name                              = "${var.ENV_PREFIX}-${var.APP_NAME}-oac"
  description                       = "OAC for ${var.ENV_PREFIX}-${var.APP_NAME} S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

####### CloudFront Distribution #######

resource "aws_cloudfront_distribution" "DISTRIBUTION" {
  enabled      = true
  comment      = "${var.ENV_PREFIX}-${var.APP_NAME}-static-files"
  price_class  = var.PRICE_CLASS
  http_version = "http2and3"

  origin {
    domain_name              = var.S3_BUCKET_REGIONAL_DOMAIN
    origin_id                = "S3-${var.S3_BUCKET_NAME}"
    origin_access_control_id = aws_cloudfront_origin_access_control.OAC.id
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-${var.S3_BUCKET_NAME}"
    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    min_ttl     = var.MIN_TTL
    default_ttl = var.DEFAULT_TTL
    max_ttl     = var.MAX_TTL

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
    cloudfront_default_certificate = true
  }

  tags = {
    Name        = "${var.ENV_PREFIX}-${var.APP_NAME}-cloudfront"
    Environment = var.ENV_PREFIX
  }
}
