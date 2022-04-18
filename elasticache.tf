resource "aws_elasticache_cluster" "main_cache" {
  cluster_id                   = "cache-cluster"
  engine                       = "redis"
  node_type                    = "cache.t2.micro"
  num_cache_nodes              = 1
  parameter_group_name         = "default.redis3.2"
  engine_version               = "3.2.10"
  port                         = 6379
  preferred_availability_zones = [var.az-1]
  subnet_group_name            = aws_elasticache_subnet_group.ec_sn_group.name
}

resource "aws_elasticache_subnet_group" "ec_sn_group" {
  name       = "ec-sn-group"
  subnet_ids = [module.network.priv_sn_zone_1, module.network.priv_sn_zone_2]
}
