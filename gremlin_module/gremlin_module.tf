resource "helm_release" "helm_deployment" {
  name          = "gremlin"
  namespace     = "gremlin"
  chart         = "./helm/gremlin"
}
