module "debian_ami_id" {
  source = "git::https://github.com/sika-training-examples/2025-07-01-generali-terraform-example.git//modules/data_debian_ami"

  debian_version = 12
}

resource "aws_instance" "hello_generali" {
  count = 4

  ami                    = module.debian_ami_id.debian_ami_id
  instance_type          = "t3.micro"
  subnet_id              = module.my_vpc.subnet_ids[count.index % length(module.my_vpc.subnet_ids)]
  vpc_security_group_ids = [aws_security_group.allow_22_80.id]
  user_data              = <<-EOF
#!/bin/bash
apt-get update
apt-get install -y curl
curl -fsSL https://ins.oxs.cz/docker.sh | sh
docker run --name web -d -e PORT=80 --net host sikalabs/hello-world-server:generali
EOF

  tags = { Name = "hello-generali-${count.index}" }
}

output "ips" {
  value = aws_instance.hello_generali[*].public_ip
}

output "see" {
  value = [
    for inst in aws_instance.hello_generali :
    "http://${inst.public_ip}"
  ]
}
