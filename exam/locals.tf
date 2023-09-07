locals {
  cluster_names = [
    "cluster-1",
    "cluster-2",
    "cluster-3",
    "cluster-4"
  ]
}

locals {
  instances = csvdecode(file("demo.csv"))
}
