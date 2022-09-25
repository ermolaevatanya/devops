resource "aws_iam_role" "ermolaeva" {
 name = "eks-cluster-ermolaeva"

 assume_role_policy = jsonencode({
 "Version":"2012-10-17",
 "Statement": [
   {
    "Effect": "Allow",
    "Principal": {
      "Service": "eks.amazonaws.com"
    },
    "Action": "sts.AssumeRole"
   }
 ]
 })
}

resource "aws_iam_role_policy_attachment" "ermolaeva-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.ermolaeva.name
}

resource "aws_eks_cluster" "ermolaeva" {
 name = "ermolaeva"
 role_arn = aws_iam_role.ermolaeva.arn

 vpc_config {
  subnet_ids = [
    aws_subnet.private-us-east-1a.id,
    aws_subnet.private-us-east-1b.id,
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1b.id,
  ]
}
  depends_on = [aws_iam_role_policy_attachment.ermolaeva-AmazonEKSClusterPolicy]
}

