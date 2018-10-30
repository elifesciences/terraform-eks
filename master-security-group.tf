resource "aws_security_group" "kubernetes--demo" {
  name        = "kubernetes--demo"
  description = "Cluster communication with worker nodes"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "terraform-eks-demo"
  }
}

# OPTIONAL: Allow inbound traffic from your local workstation external IP
#           to the Kubernetes. You will need to replace A.B.C.D below with
#           your real IP. Services like icanhazip.com can help you find this.
#resource "aws_security_group_rule" "demo-cluster-ingress-workstation-https" {
#  cidr_blocks       = ["A.B.C.D/32"]
#  description       = "Allow workstation to communicate with the cluster API Server"
#  from_port         = 443
#  protocol          = "tcp"
#  security_group_id = "${aws_security_group.demo-cluster.id}"
#  to_port           = 443
#  type              = "ingress"
#}
#
