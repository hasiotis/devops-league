data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc]
  }
}

data "aws_subnet" "region_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = [var.subnet]
  }
}

