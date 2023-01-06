locals {
  tags = {
    Name = var.instance_name
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = var.most_recent
  owners      = var.owners

  filter {
    name   = "name"
    values = var.filter_instance_values
  }
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  subnet_id                   = var.aws_subnet_id
  vpc_security_group_ids      = var.aws_security_group_id
  associate_public_ip_address = var.associate_public_ip_address

  tags = merge(
    local.tags,
    lookup(var.resource_specific_tags, "general", {})
  )
}