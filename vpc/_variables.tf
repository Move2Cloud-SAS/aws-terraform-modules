########################### VPC CONFIGURATION ###############################
variable "AWS_REGION" {}
variable "VPC_CIDR" {}
variable "PUBLIC_SUBNET_CIDRS" {}
variable "PRIVATE_APP_SUBNET_CIDRS" {}
variable "PRIVATE_DB_SUBNET_CIDRS" {}
variable "SUBNET_AZS" {}

############################### Project name ##################################
variable "APP_NAME" {}
variable "ENV_PREFIX" {}
