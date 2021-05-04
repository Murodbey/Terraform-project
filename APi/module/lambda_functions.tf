provider "aws" {
  region          = "us-west-2"
}

data "archive_file" "product_a" {
    type          = "zip"
    source_dir    = "module/products/product_a"
    output_path   = "lambda_function_product_a.zip"
}

resource "null_resource" "product_a" {
  triggers = {
    main         = "${base64sha256(file("module/products/product_a/app.py"))}"
    requirements = "${base64sha256(file("module/products/product_a/requirements.txt"))}"
  }

  provisioner "local-exec" {
    command = "module/products/product_a/venv/bin/pip install -r module/products/product_a/requirements.txt -t module/products/product_a/venv//lib"
  }
}



data "archive_file" "product_b" {
    type          = "zip"
    source_dir    = "module/products/product_b"
    output_path   = "lambda_function_product_b.zip"
}

resource "null_resource" "product_b" {
  triggers = {
    main         = "${base64sha256(file("/module/products/product_b/app.py"))}"
    requirements = "${base64sha256(file("/module/products/product_b/requirements.txt"))}"
  }

  provisioner "local-exec" {
    command = "module/products/product_b/venv/bin/pip install -r module/products/product_b/requirements.txt -t module/products/product_b/venv//lib"
  }
}

resource "aws_lambda_function" "product_a" {
    filename         = "lambda_function_product_a.zip"
    function_name    = "lambda_function_product_a"
    role             = aws_iam_role.iam_for_lambda_tf.arn
    handler          = "app.lambda_handler"
    runtime          = "python3.6"
    source_code_hash = data.archive_file.product_a.output_base64sha256
}


resource "aws_lambda_function" "product_b" {
    filename         = "lambda_function_product_b.zip"
    function_name    = "lambda_function_product_b"
    role             = aws_iam_role.iam_for_lambda_tf.arn
    handler          = "app.lambda_handler"
    runtime          = "python3.6"
    source_code_hash = data.archive_file.product_b.output_base64sha256
}