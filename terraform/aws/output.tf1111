output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "availability_zones" {
  description = "Availability Zones used"
  value       = data.aws_availability_zones.available.names
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.gw.id
}

output "public_route_table_id" {
  description = "Public Route Table ID"
  value       = aws_route_table.public.id
}


output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.main.name
}

output "ecs_cluster_arn" {
  description = "ECS Cluster ARN"
  value       = aws_ecs_cluster.main.arn
}


output "alb_name" {
  description = "Application Load Balancer Name"
  value       = aws_lb.main.name
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.main.arn
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.main.dns_name
}

output "alb_security_group_id" {
  description = "ALB Security Group ID"
  value       = aws_security_group.lb.id
}
output "db_secret_name" {
  description = "Database secret name"
  value       = aws_secretsmanager_secret.db_password.name
}

output "db_secret_arn" {
  description = "Database secret ARN"
  value       = aws_secretsmanager_secret.db_password.arn
}

output "ecs_task_execution_role_name" {
  description = "ECS Task Execution Role Name"
  value       = aws_iam_role.ecs_task_execution_role.name
}

output "ecs_task_execution_role_arn" {
  description = "ECS Task Execution Role ARN"
  value       = aws_iam_role.ecs_task_execution_role.arn
}
output "random_suffix" {
  description = "Random suffix used in resource names"
  value       = random_id.suffix.hex
}
