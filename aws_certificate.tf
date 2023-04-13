data "aws_acm_certificate" "certificate_new" {
    domain = var.route_record
    statuses = [ "ISSUED" ]
    most_recent = true
}