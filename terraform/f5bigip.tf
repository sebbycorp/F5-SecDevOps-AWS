

module "bigip" {
  source                 = "F5Networks/bigip-module/aws"
  count                  = var.instance_count
  prefix                 = format("%s-1nic", var.prefix)
  ec2_key_name           = aws_key_pair.generated_key.key_name
  f5_password            = random_string.password.result
  mgmt_subnet_ids        = [{ "subnet_id" = aws_subnet.mgmt.id, "public_ip" = true, "private_ip_primary" = "" }]
  mgmt_securitygroup_ids = [module.mgmt-network-security-group.security_group_id]
}