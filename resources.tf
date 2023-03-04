resource "flexibleengine_vpc_v1" "vpc" {
  name = "vpc-${var.project}"
  cidr = var.vpc_cidr
}

resource "flexibleengine_vpc_subnet_v1" "subnet" {
  name       = "subnet-${var.project}"
  cidr       = var.subnet_cidr
  gateway_ip = var.gateway_ip
  vpc_id     = flexibleengine_vpc_v1.vpc.id

  dns_list = ["100.125.0.28","100.125.0.29"]
}


resource "flexibleengine_networking_port_v2" "instance_port" {
  network_id         = flexibleengine_vpc_subnet_v1.subnet.id
  count              = 1
  admin_state_up     = "true"
}


resource "flexibleengine_vpc_eip_v1" "new_eip" {
  count = 1
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = var.instance_count > 1 ? format("%s-%d", "bandwidth-${var.project}", count.index + 1) : "bandwidth-${var.project}"
    size        = var.eip_bandwidth
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "flexibleengine_vpc_eip_associate" "associated" {
  public_ip = flexibleengine_vpc_eip_v1.new_eip[0].address
  port_id = flexibleengine_networking_port_v2.instance_port[0].id
}