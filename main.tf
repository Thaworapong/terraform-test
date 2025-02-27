module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = "thaworapong-bucket"
}

output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}

module "vpc" {
  source                = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  vpc_name             = "my-vpc"
  public_subnet_cidr_1  = "10.0.1.0/24"
  public_subnet_cidr_2  = "10.0.2.0/24"
  private_subnet_cidr_1 = "10.0.3.0/24"
  private_subnet_cidr_2 = "10.0.4.0/24"
  availability_zone_1   = "us-east-1a"
  availability_zone_2   = "us-east-1b"
}

module "ec2_instance" {
  source            = "./modules/ec2"
  ami_id           = "ami-0abcdef1234567890"  # Replace with a valid AMI ID
  instance_type    = "t2.micro"
  subnet_id        = module.vpc.public_subnet_1_id  # Use a public or private subnet
  key_name         = "my-keypair"  # Replace with your SSH key
  security_group_id = aws_security_group.ec2_sg.id
  public_ip        = true  # Set false if in a private subnet
  instance_name    = "MyEC2Instancetest"
}
