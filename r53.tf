data "aws_vpc" "default" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

resource "aws_route53_zone" "private" {
  name = "kubernetes.in"

  vpc {
    vpc_id = "${data.aws_vpc.default.id}"
  }
}
