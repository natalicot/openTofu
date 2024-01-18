# OpenTofu and Terraform Demo

This repository demonstrates the ease of switching between OpenTofu and Terraform for efficient cloud infrastructure management. It showcases the setup and management of AWS resources, emphasizing the similarities between Terraform and OpenTofu, and the seamless transition between the two. The example also illustrates the integration of Terraform workspaces and how OpenTofu can completely replace Terraform with no configuration changes.

## Prerequisites

- Terraform
- OpenTofu

Install these tools using Homebrew:

```

brew install terraform
brew install opentofu

```

Check the installed versions:

```

terraform version
tofu version

```

## Configuration

The Terraform configuration includes an AWS provider and sets up an EC2 instance using an Ubuntu AMI. It also configures an S3 backend with a DynamoDB table for state management.

```

# Terraform Configuration

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }

  backend "s3" {
    bucket          = "opentofu-demo-state-bucket"
    key             = "terraform.tfstate"
    region          = "us-east-1"
    dynamodb_table  = "opentofu-demo-state-lock"
    encrypt         = true
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  # ... additional configuration
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  tags = {
    Name = "HelloWorld"
  }
}

```

## Workflow

### Using to Terraform

Initialize the Terraform configuration with workspace support:

```

terraform init
terraform workspace list
terraform workspace new dev

```

Plan and apply the configuration:

```

terraform plan
terraform apply

```

### Switching to OpenTofu

Initialize OpenTofu configuration with workspace support:

```

tofu init
tofu workspace list

```

Plan and apply the configuration:

```

tofu plan
tofu apply
tofu destroy

```

Set an alias:

```

alias tf=tofu
tf plan

```

## Conclusion

This demo illustrates how OpenTofu can completely replace Terraform with no configuration changes, offering a seamless transition. It highlights the versatility of both tools in managing cloud infrastructure, with the added functionality of workspace management, making it highly relevant for cloud architects.

