output "CLOUDFRONT_DOMAIN" {
  value       = aws_cloudfront_distribution.DISTRIBUTION.domain_name
  description = "CloudFront distribution domain name (e.g. d1234.cloudfront.net)"
}

output "CLOUDFRONT_DISTRIBUTION_ID" {
  value       = aws_cloudfront_distribution.DISTRIBUTION.id
  description = "CloudFront distribution ID"
}

output "CLOUDFRONT_ARN" {
  value       = aws_cloudfront_distribution.DISTRIBUTION.arn
  description = "CloudFront distribution ARN"
}
