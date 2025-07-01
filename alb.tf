module "my_alb" {
  source = "git::https://github.com/sika-training-examples/2025-07-01-generali-terraform-example.git//modules/alb"

  name                = "my-alb"
  vpc_id              = module.my_vpc.vpc_id
  subnet_id           = module.my_vpc.subnet_ids
  security_group_ids  = [aws_security_group.allow_22_80.id]
  target_instance_ids = aws_instance.hello_generali[*].id
}

output "url" {
  value = module.my_alb.url
}
