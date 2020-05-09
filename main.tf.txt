resource "aws_iam_role_policy" "ec2_policy" {
  name = "ec2-policy"
  role = "${aws_iam_role.kubernetes-role.id}"

  policy = "${file("adminpolicy.json")}"
  #  tags = {
  #   env = "dev"
  # }
}

resource "aws_iam_role" "kubernetes-role" {
  name = "kubernetes-role"

  assume_role_policy = "${file("assumepolicy.json")}"
  tags = {
    env = "dev"
  }
}


resource "aws_iam_instance_profile" "ec2-server-profile" {
  name = "ec2-server-profile"
  role = "${aws_iam_role.kubernetes-role.name}"
}
