resource "aws_internet_gateway" "ermolaeva_igw" {
 vpc_id = aws_vpc.ermolaeva_vpc.id

 tags = {
  Name = "ermolaeva_igw"
 }
}
