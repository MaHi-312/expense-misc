terraform {
  backend "s3" {
    bucket = "terraform-malleswari"
    key = "misc/jenkins-ip/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_instance" "instance" {
  instance_id = "i-0890cd4106f346585"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.malleswaridevops.online"
  type    = "A"
  zone_id = "Z088606431E8311EPHBFV"
  records = [data.aws_instance.instance.public_ip]
  ttl = 10
}