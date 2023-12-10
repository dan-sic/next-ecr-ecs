data "aws_caller_identity" "current" {}

data "aws_vpc" "main" {
  tags = {
    Name = "my-vpc-1"
  }
}

data "aws_subnets" "public" {
  tags = {
    Type = "public"
  }
}

data "aws_subnets" "private" {
  tags = {
    Type = "private"
  }
}
