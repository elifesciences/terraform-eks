locals {
  config_map_aws_auth = <<CONFIGMAPAWSAUTH
# generated by Terraform

apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${aws_iam_role.kubernetes--demo--worker.arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
    - rolearn: arn:aws:iam::512686554592:role/kubernetes--demo--AmazonEKSUserRole
      groups:
        - system:masters
CONFIGMAPAWSAUTH
}

output "config_map_aws_auth" {
  value = "${local.config_map_aws_auth}"
}

