resource "aws_eks_cluster" "demo" {
  name            = "${var.cluster-name}"
  role_arn        = "${aws_iam_role.kubernetes--demo.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.kubernetes--demo.id}"]
    subnet_ids         = ["${var.subnet_id_1}", "${var.subnet_id_2}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.kubernetes--demo--AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.kubernetes--demo--AmazonEKSServicePolicy",
  ]
}

