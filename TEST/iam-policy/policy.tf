resource "aws_iam_policy" "s3-policy" {
  name        = "s3-policy"
  path        = "/"
  description = "s3 policy for Instance "

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "s3-attach" {
  role       = aws_iam_role.ec2-role.name
  policy_arn = aws_iam_policy.s3-policy.arn
}