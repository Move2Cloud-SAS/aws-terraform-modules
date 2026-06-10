####### S3 Bucket Policy — allows CloudFront OAC + keeps public read #######

data "aws_iam_policy_document" "S3_POLICY" {
  # CloudFront OAC access
  statement {
    sid    = "AllowCloudFrontOAC"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions   = ["s3:GetObject"]
    resources = ["${var.S3_BUCKET_ARN}/*"]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.DISTRIBUTION.arn]
    }
  }

  # Keep public read access during transition (can be removed once all URLs use CloudFront)
  statement {
    sid    = "AllowPublicRead"
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions   = ["s3:GetObject"]
    resources = ["${var.S3_BUCKET_ARN}/*"]
  }
}

resource "aws_s3_bucket_policy" "BUCKET_POLICY" {
  bucket = var.S3_BUCKET_NAME
  policy = data.aws_iam_policy_document.S3_POLICY.json
}
