########################### Project ###########################
variable "APP_NAME" {}
variable "ENV_PREFIX" {}

########################### S3 Origin #########################
variable "S3_BUCKET_NAME" {
  description = "Name of the existing S3 bucket to use as CloudFront origin"
}

variable "S3_BUCKET_REGIONAL_DOMAIN" {
  description = "Regional domain of the S3 bucket (e.g. my-bucket.s3.eu-west-1.amazonaws.com)"
}

variable "S3_BUCKET_ARN" {
  description = "ARN of the existing S3 bucket"
}

########################### CloudFront ########################
variable "PRICE_CLASS" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_100" # US, Europe, Asia
}

variable "DEFAULT_TTL" {
  description = "Default cache TTL in seconds"
  type        = number
  default     = 86400 # 1 day
}

variable "MAX_TTL" {
  description = "Maximum cache TTL in seconds"
  type        = number
  default     = 31536000 # 1 year
}

variable "MIN_TTL" {
  description = "Minimum cache TTL in seconds"
  type        = number
  default     = 0
}
