env = "prod"


tags = {
  company_name  = "Rajesh Tech"
  business      = "ecommerce"
  business_unit = "retail"
  cost_center   = "322"
  project_name  = "roboshop"
}

vpc = {
  main = {
    cidr_block = "10.10.0.0/16"
    subnets = {
      web    = {cidr_block  = ["10.10.0.0/24", "10.10.1.0/24"] }
      app    = { cidr_block = ["10.10.2.0/24", "10.10.3.0/24"] }
      db     = { cidr_block = ["10.10.4.0/24", "10.10.5.0/24"] }
      public = { cidr_block = ["10.10.6.0/24", "10.10.7.0/24"] }
    }

  }
}

default_vpc_id = "vpc-071092d6b15659f90"
default_vpc_rt = "rtb-09612d47bd3dd19e9"
allow_ssh_cidr = [ "172.31.28.204/32" ]
zone_id        = "Z05176683IFS2PVLQ9VF0"
kms_key_id     = "4f740efe-1e68-4e25-b2d1-d2fd4af5fa91"
kms_key_arn    = "arn:aws:kms:us-east-1:765371225572:key/4f740efe-1e68-4e25-b2d1-d2fd4af5fa91"
allow_prometheus_cidr =  ["72.31.17.11/32"]

rabbitmq = {
  main = {
    instance_type = "t3.small"
    component     = "rabbitmq"
  }
}


rds  =  {
  main = {
    component         = "rds"
    engine            = "aurora-mysql"
    engine_version    = "5.7.mysql_aurora.2.11.3"
    db_name           = "dummy"
    db_instance_count = 1
    instance_class    = "db.t3.medium"
  }
}

documentdb = {
  main = {
    component         = "docdb"
    engine            = "docdb"
    engine_version    = "4.0.0"
    db_instance_count = 1
    instance_class    = "db.t3.medium"
  }
}

elasticache = {
  main = {
    component               = "elasticache"
    engine                  = "redis"
    engine_version          = "6.x"
    replicas_per_node_group = 1
    num_node_groups         = 1
    node_type               = "cache.t3.small"
    parameter_group_name    = "default.redis6.x.cluster.on"
  }
}

alb = {
  public = {
    name               = "public"
    internal           = false
    load_balancer_type = "application"
    subnet_ref         = "public"
  }
  private = {
    name               = "private"
    internal           = true
    load_balancer_type = "application"
    subnet_ref         = "app"
  }
}

apps = {
  cart = {
    component        = "cart"
    app_port         = 8080
    instance_type    = "t3.small"
    desired_capacity = 2
    max_size         = 5
    min_size         = 2
    subnet_ref       = "app"
    lb_ref           = "private"
    lb_rule_priority = 100
  }

  catalogue = {
    component        = "catalogue"
    app_port         = 8080
    instance_type    = "t3.small"
    desired_capacity = 2
    max_size         = 5
    min_size         = 2
    subnet_ref       = "app"
    lb_ref           = "private"
    lb_rule_priority = 101
    extra_param_access = ["arn:aws:ssm:us-east-1:600222537277:parameter/roboshop.prod.docdb.*"]
  }
  user = {
    component        = "user"
    app_port         = 8080
    instance_type    = "t3.small"
    desired_capacity = 2
    max_size         = 5
    min_size         = 2
    subnet_ref       = "app"
    lb_ref           = "private"
    lb_rule_priority = 102
    extra_param_access = ["arn:aws:ssm:us-east-1:600222537277:parameter/roboshop.prod.docdb.*"]
  }
  shipping = {
    component        = "shipping"
    app_port         = 8080
    instance_type    = "t3.small"
    desired_capacity = 2
    max_size         = 5
    min_size         = 2
    subnet_ref       = "app"
    lb_ref           = "private"
    lb_rule_priority = 103
    extra_param_access = ["arn:aws:ssm:us-east-1:600222537277:parameter/roboshop.prod.mysql.*"]
  }
  payment = {
    component        = "payment"
    app_port         = 8080
    instance_type    = "t3.small"
    desired_capacity = 2
    max_size         = 5
    min_size         = 2
    subnet_ref       = "app"
    lb_ref           = "private"
    lb_rule_priority = 104
  }

  frontend = {
    component        = "frontend"
    app_port         = 80
    instance_type    = "t3.small"
    desired_capacity = 2
    max_size         = 5
    min_size         = 2
    subnet_ref       = "web"
    lb_ref           = "public"
    lb_rule_priority = 100
  }
}