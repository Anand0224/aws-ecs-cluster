resource "aws_launch_template" "ecs_lt" {
 name_prefix   = "ecs-template"
 image_id      = "ami-066784287e358dad1"
 instance_type = "t2.micro"

 #key_name               = "ec2ecsglog"
 vpc_security_group_ids = [aws_security_group.security_group.id]
#  iam_instance_profile {
#    name = "ecsInstanceRole"
#  }

 block_device_mappings {
   device_name = "/dev/xvda"
   ebs {
     volume_size = 30
     volume_type = "gp2"
   }
 }

 tag_specifications {
   resource_type = "instance"
   tags = {
     Name = "ecs-instance"
   }
 }

 user_data = filebase64("${path.module}/ecs.sh")
}

resource "aws_autoscaling_group" "ecs_asg" {
 vpc_zone_identifier = [aws_subnet.subnet.id, aws_subnet.subnet2.id]
 desired_capacity    = 1
 max_size            = 1
 min_size            = 1

 launch_template {
   id      = aws_launch_template.ecs_lt.id
   version = "$Latest"
 }

 tag {
   key                 = "AmazonECSManaged"
   value               = true
   propagate_at_launch = true
 }
}