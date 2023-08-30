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
         web    = {cidr_block  = [ "10.0.0.0/24", "10.0.1.0/24"] }
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
        component      = "rds"
        engine         = "aurora-mysql"
        engine_version = "5.7.mysql_aurora.2.11.3"
        database_name  = "dummy"
        instance_count = 1
        instance_class = "db.t3.small"
    }
}

documentdb = {
    main = {
        component = "docdb"
    }
}