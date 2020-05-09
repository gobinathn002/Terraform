resource "aws_s3_bucket" "bucket-for-kubernetes-config-k8s" {
  bucket = "bucket-for-kubernetes-config-k8s"
  acl    = "private"

  tags = {
    Name        = "bucket-for-kubernetes-config-k8s"
    Environment = "Dev"
  }
}
