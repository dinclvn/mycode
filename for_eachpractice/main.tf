locals { rgs = {
  "alpha"   = "eastus"
  "bravo"   = "southindia"
  "charlie" = "westus2"
} }

resource "null_resource" "rgs" {
  for_each = tomap(local.rgs)
  triggers = {
    name   = each.key
    region = each.value     //each.key.value
  }
}

output "rgs" {
  value = null_resource.rgs
}
