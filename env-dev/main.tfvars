env = "dev"

components  = {
    frontend  = { tags = { Monitor = "true" , env = "dev"} }
    mongodb   =  { tags = {  env = "dev"} }
    catalogue = { tags = { Monitor = "true" , env = "dev"} }
    redis     = { tags = {env ="dev"} }
    user      = { tags = { Monitor = "true" , env = "dev"} }
    cart      = { tags = { Monitor = "true" , env = "dev"} }
    mysql     = { tags = {env = "dev"} }
    shipping  = { tags = { Monitor = "true" , env = "dev"} }
    rabbitmq  = {tags = {env ="dev"} }
    payment   = { tags = { Monitor = "true" , env = "dev"} }
    dispatch  = { tags = { env = "dev"} }

}

tags = {
    company_name  = "Rajesh Tech"
    business      = "ecommerce"
    business_unit = "retail"
    cost_center   = "322"
    project_name  = "roboshop"
}

vpc = {
    main = {
        cidr_block = "10.0.0.0/16"
     subnets = {
         web    = {cidr_block  = ["10.0.0.0/24", "10.0.1.0/24"] }
         app    = { cidr_block = ["10.0.2.0/24", "10.0.3.0/24"] }
         db     = { cidr_block = ["10.0.4.0/24", "10.0.5.0/24"] }
         public = { cidr_block = ["10.0.6.0/24", "10.0.7.0/24"] }
     }

    }
}

default_vpc_id = "vpc-0bfb2d3938d8658ac"
default_vpc_rt = "rtb-0dfeeb50688cc9131"
allow_ssh_cidr = [ "172.31.92.189/32" ]
zone_id        = "Z0536318FEJNHSSCY1LA"
kms_key_id     = "841e1b80-4724-43b6-939b-ec575eebb2b6"
kms_key_arn    = "arn:aws:kms:us-east-1:600222537277:key/841e1b80-4724-43b6-939b-ec575eebb2b6"

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
        db_name        = "dummy"
        db_instance_count = 1
        instance_class    = "db.t3.small"
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
        node_type               = "cache.t3.micro"
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
        desired_capacity = 1
        max_size         = 1
        min_size         = 1
        subnet_ref       = "app"
        lb_ref           = "private"
        lb_rule_priority = 100
    }

    catalogue = {
        component        = "catalogue"
        app_port         = 8080
        instance_type    = "t3.small"
        desired_capacity = 1
        max_size         = 1
        min_size         = 1
        subnet_ref       = "app"
        lb_ref           = "private"
        lb_rule_priority = 101
        extra_param_access = ["arn:aws:ssm:us-east-1:600222537277:parameter/roboshop.dev.docdb.*"]
    }
    user = {
        component        = "user"
        app_port         = 8080
        instance_type    = "t3.small"
        desired_capacity = 1
        max_size         = 1
        min_size         = 1
        subnet_ref       = "app"
        lb_ref           = "private"
        lb_rule_priority = 102
        extra_param_access = ["arn:aws:ssm:us-east-1:600222537277:parameter/roboshop.dev.docdb.*"]
    }
    shipping = {
        component        = "shipping"
        app_port         = 8080
        instance_type    = "t3.small"
        desired_capacity = 1
        max_size         = 1
        min_size         = 1
        subnet_ref       = "app"
        lb_ref           = "private"
        lb_rule_priority = 103
        extra_param_access = ["arn:aws:ssm:us-east-1:600222537277:parameter/roboshop.dev.mysql.*"]

    }
    payment = {
        component        = "payment"
        app_port         = 8080
        instance_type    = "t3.small"
        desired_capacity = 1
        max_size         = 1
        min_size         = 1
        subnet_ref       = "app"
        lb_ref           = "private"
        lb_rule_priority = 104
    }

    frontend = {
        component        = "frontend"
        app_port         = 80
        instance_type    = "t3.small"
        desired_capacity = 1
        max_size         = 1
        min_size         = 1
        subnet_ref       = "web"
        lb_ref           = "public"
        lb_rule_priority = 100
    }
}