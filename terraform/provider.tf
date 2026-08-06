provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "ShopZone"
      Environment = "Production"
      Customer    = "ShopZone"
      Partner     = "Descasio"
      ManagedBy   = "Terraform"
      Repository  = "shopzone-cloud-native-platform"
    }
  }
}