# Create an Elastic Cloud Server resource like Bastion
resource "flexibleengine_compute_instance_v2" "bastion" {
  name     = "ecs-${var.project}-bastion"
  count    = 1

  flavor_name = "s6.small.1"  
  image_name  = "OBS Ubuntu 20.04"
  key_pair        = var.keypair
  security_groups = var.sg-bastion
  
  network {
    uuid = flexibleengine_vpc_subnet_v1.subnet.id
    port = flexibleengine_networking_port_v2.instance_port[0].id
  }

}

# Create an Elastic Cloud Server resource ( x instance count times)
resource "flexibleengine_compute_instance_v2" "instances" {
  name     = "ecs-${var.project}-v${count.index}"
  count    = var.instance_count

  flavor_name = "s6.small.1"  
  image_name  = "OBS Ubuntu 20.04"
  key_pair        = var.keypair
  security_groups = var.sg-lan
  
  network {
    uuid = flexibleengine_vpc_subnet_v1.subnet.id
  }

}