/* Alta3 Research - rzfeeser@alta3.com
   Working with "for_each" within a null_resource */


/* a list of local variables */
locals {
  avengers = {
               "Iron Man"= {
                "power"= "money"
                "enemy"= "Iron Monger"}
               "Black Panther"= {
                "power"= "vibranium suit"
                "enemy"= "War Monger"}
               "She-Hulk"= {
                "power"= "super strength"
                "enemy"= "Abomination"}
             }
}


/* The null_resource implements the standard resource lifecycle but takes no more action */
resource "null_resource" "avengers" {
  for_each = tomap(local.avengers)

/* triggers allows specifying a random set of values that when
     changed will cause the resource to be replaced */

triggers = {
    name = each.key  // a special variable, "each" created by terraform
    power = each.value.power
    enemy = each.value.enemy
}
}

/* We want these outputs */
output "avengers" {
  value = null_resource.avengers
}
