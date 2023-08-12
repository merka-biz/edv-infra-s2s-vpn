locals {
  company       = "edv"
  country       = "ec"
  solution_name = join("-", [local.company, local.country])
}
