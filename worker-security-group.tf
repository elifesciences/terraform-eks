resource "aws_security_group" "kubernetes--demo--worker" {
  name        = "kubernetes--demo--worker"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Project = "kubernetes--demo"
  }
}

resource "aws_security_group_rule" "kubernetes--demo--worker-ingress-self" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.kubernetes--demo--worker.id}"
  source_security_group_id = "${aws_security_group.kubernetes--demo--worker.id}"
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "kubernetes--demo--worker-ingress-cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.kubernetes--demo--worker.id}"
  source_security_group_id = "${aws_security_group.kubernetes--demo.id}"
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "kubernetes--demo--worker-ingress-public" {
  description              = "Allow worker to expose NodePort services"
  from_port                = 30000
  to_port                  = 32767
  cidr_blocks              = ["0.0.0.0/0"]
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.kubernetes--demo--worker.id}"
  type                     = "ingress"
}

