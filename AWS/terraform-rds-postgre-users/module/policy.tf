resource "aws_iam_policy" "DataScience" {
   name        = "DataScience"
   description = "DataScience"
   policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Action": [
               "rds-db:connect"
         ],
         "Resource": [
               "arn:aws:rds-db:us-east-2:713287746880:dbuser:*/*"
         ]
      }
   ]
}
EOF
}
 
 resource "aws_iam_group_policy_attachment" "datascience" {
   group      = aws_iam_group.developers.name
   policy_arn = aws_iam_policy.DataScience.arn
 }
 
 
        