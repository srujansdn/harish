resource "aws_s3_bucket" "s3backend" {
  bucket = "hackathon-squad6"

  tags = {
    Name  = "HCLHackathon-Squad6"
  }
}



#EKS Cluster
module "eks" {
    source = ""
    version = ""
}
reource ""