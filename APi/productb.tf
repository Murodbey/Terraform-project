resource "aws_api_gateway_rest_api" "product_b" {
  name = "product_b"
}

resource "aws_api_gateway_resource" "product_b" {
  parent_id   = aws_api_gateway_rest_api.product_b.root_resource_id
  path_part   = "product_b"
  rest_api_id = aws_api_gateway_rest_api.product_b.id
}

resource "aws_api_gateway_method" "product_b" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.product_b.id
  rest_api_id   = aws_api_gateway_rest_api.product_b.id
}

resource "aws_api_gateway_integration" "product_b" {
  http_method = aws_api_gateway_method.product_b.http_method
  resource_id = aws_api_gateway_resource.product_b.id
  rest_api_id = aws_api_gateway_rest_api.product_b.id
  type        = "MOCK"
}

resource "aws_api_gateway_deployment" "product_b" {
  rest_api_id = aws_api_gateway_rest_api.product_b.id

  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.product_b.id,
      aws_api_gateway_method.product_b.id,
      aws_api_gateway_integration.product_b.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "product_b" {
  deployment_id = aws_api_gateway_deployment.product_b.id
  rest_api_id   = aws_api_gateway_rest_api.product_b.id
  stage_name    = "product_b"
}