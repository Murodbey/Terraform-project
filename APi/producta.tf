resource "aws_api_gateway_rest_api" "product_a" {
  name = "product_a"
}

resource "aws_api_gateway_resource" "product_a" {
  parent_id   = aws_api_gateway_rest_api.product_a.root_resource_id
  path_part   = "product_a"
  rest_api_id = aws_api_gateway_rest_api.product_a.id
}

resource "aws_api_gateway_method" "product_a" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.product_a.id
  rest_api_id   = aws_api_gateway_rest_api.product_a.id
}

resource "aws_api_gateway_integration" "product_a" {
  http_method = aws_api_gateway_method.product_a.http_method
  resource_id = aws_api_gateway_resource.product_a.id
  rest_api_id = aws_api_gateway_rest_api.product_a.id
  type        = "MOCK"
}

resource "aws_api_gateway_deployment" "product_a" {
  rest_api_id = aws_api_gateway_rest_api.product_a.id

  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.product_a.id,
      aws_api_gateway_method.product_a.id,
      aws_api_gateway_integration.product_a.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "product_a" {
  deployment_id = aws_api_gateway_deployment.product_a.id
  rest_api_id   = aws_api_gateway_rest_api.product_a.id
  stage_name    = "product_a"
}