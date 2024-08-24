variable "vpc_name" {
  default = "demo_vpc"  
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC cidr"
}

variable "demo_igw" {
  default     = "demo_igw"
  description = "internet gateway"
}

variable "ecs-security-group" {
  default     = "demo-security-group"
  description = "security group"
}

variable "cluster_name" {
  default     = "demo-cluster"
  description = "ECS cluster"
}

variable "ecs_task_name" {
  default     = "demo-task"
  description = "ECS task definition"
}

variable "ecs_service_name" {
  default     = "demo-service"
  description = "ECS service"
}

variable "launch_type" {
  default     = "FARGATE"
  description = "ECS launch type"
}  

variable "desired_count" {
  default     = 2
  description = "Container instances"
} 