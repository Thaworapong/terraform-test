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


