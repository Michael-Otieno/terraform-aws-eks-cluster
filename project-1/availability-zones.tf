data "aws_availability_zones" "available" {
    state = "available" 
    exclude_names = [ "us-west-1" ]
}