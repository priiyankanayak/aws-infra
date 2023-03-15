# resource "aws_route53_record" "routerecord" {
#     depends_on = [
#       aws_instance.instance_app
#     ]
#     name = var.route_record
#     zone_id = var.route_zoneid
#     type = "A"
#     ttl = 300
#     records = [aws_instance.instance_app.public_ip]
# }

data "aws_route53_zone" "selected" {
  name         = var.route_record
  # private_zone = true
}

resource "aws_route53_record" "route_record" {
    depends_on = [
      aws_instance.instance_app
    ]
    name = var.route_record
    zone_id = data.aws_route53_zone.selected.zone_id
    # zone_id = var.route53_zone_id
    type = "A"
    ttl = 60
    records = [aws_instance.instance_app.public_ip]
}