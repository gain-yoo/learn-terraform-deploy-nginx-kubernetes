resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "deployment-nginx"
    labels = {
      App = "ScalableNginx"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "ScalableNginx"
      }
    }
    template {
      metadata {
        labels = {
          App = "ScalableNginx"
        }
      }
      spec {
        container {
          image = "nginx:1.7.8"
          name  = "nginx"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
