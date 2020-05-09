resource "aws_instance" "dev-server" {
  ami                  = "ami-04b2519c83e2a7ea5"
  instance_type        = "t2.micro"
  count                = "1"
  iam_instance_profile = "${aws_iam_instance_profile.ec2-server-profile.name}"
#  provisioner "local-exec" {
 #   command = "echo ${aws_instance.dev-server.private_ip} >> private_ips.txt"
    tags = {
      Name = "dev-server"
    }
#  }
}

#output "ip" {
 # value = "${aws_instance.dev-server.public_ip}"
#}
