resource "aws_iam_role" "kubernetes--demo--user" {
  name = "kubernetes--demo--AmazonEKSUserRole"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "AWS": "arn:aws:iam::512686554592:user/elife-alfred" },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": { "AWS": "arn:aws:iam::512686554592:user/PeterHooper" },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": { "AWS": "arn:aws:iam::512686554592:user/HemBrahmbhatt" },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": { "AWS": "arn:aws:iam::512686554592:user/JavierYenes" },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": { "AWS": "arn:aws:iam::512686554592:user/CoryDonkin" },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

#  what this role can do is stored in the aws-auth ConfigMap in kube-system namespace
