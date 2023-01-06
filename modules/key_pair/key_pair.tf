locals {
  tags = merge(
    lookup(var.resource_specific_tags, "general", {}),
    lookup(var.resource_specific_tags, "key_pair", {})
  )
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = var.key_name
  create_private_key = true

  tags = local.tags
}

resource "aws_secretsmanager_secret" "this" {
  name         = var.secret_name
}
resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = module.key_pair.private_key_pem
}