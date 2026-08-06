#############################################
# Amazon Elastic Container Registry (ECR)
#############################################

resource "aws_ecr_repository" "shopzone" {
  name                 = "${var.project_name}-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-repository"
    Environment = var.environment
    Project     = var.project_name
  }
}

#############################################
# ECR Lifecycle Policy
#############################################

resource "aws_ecr_lifecycle_policy" "shopzone" {
  repository = aws_ecr_repository.shopzone.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep only the latest 10 images"

        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }

        action = {
          type = "expire"
        }
      }
    ]
  })
}