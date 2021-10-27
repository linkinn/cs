<h4 align="center">
	🚧 TERRAFORM - EKS  🚧
</h4>

<br/><br/>

Contents
=================
   * [About](#about)
   * [Installation](#installation)
      * [Requirements](#requirements)
   * [Technologies](#technologies)
   * [Author](#author)

<br/><br/>

# About

Automated infrastructure system as code using terraform in aws provider, github actions and eks(kubernetes aws) were also used.

<br/><br/>

# Installation
### Requirements

Before starting, you will need to have the following tools installed on your machine.:
[Git](https://git-scm.com), [Terraform](https://www.terraform.io/).
Besides, it's nice to have an editor to work with code like [VSCode](https://code.visualstudio.com/)

### Versions

- Terraform: ">= 0.15"
- AWS: ">= 3.0" 



<br/>

## 1 - Configurations backend

### Using terrafom cloud

- Create account in [TerraformCloud](https://app.terraform.io/)
- Create terradorm cloud api key
- Configure api key

```bash
$ terraform login

# providers.tf
backend "remote" {
    organization = "your_organization"

    workspaces {
      name = "your_workspace_terraform_cloud"
    }
  }

# add environment variables in terraform cloud plataform
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

### Using s3 backend

- Configuration aws s3

```bash
# providers.tf
terraform {
  backend "s3" {
    bucket         = "adt-tfstate"
    key            = "state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "adt-tfstate-lock"
    encrypt        = true
  }
}

# add aws envitonment in local
export AWS_ACCESS_KEY_ID=***
export AWS_SECRET_ACCESS_KEY=***
```

## 2 - Running commands

```bash
$ terraform init

$ terraform validate

$ terraform plan

$ terraform apply
```

## 3 - Add secrets in github settings

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION
- CLUSTER_NAME
- TF_API_TOKEN
- KUBERNETES_ROLE_ARN
- DOCKER_ID
- DOCKER_PASSWORD
- IMAGE_NAME

<br/><br/>

# Technologies

The following tools were used in the construction of the project.:

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [Github](https://github.com/)
- [Kubernetes](https://kubernetes.io/)

<br/><br/>

# Author

<a href="https://github.com/linkinn">
 <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/12723939?s=96&v=4" width="100px;" alt=""/>
 <br />
 <sub><b>Fillipi Nascimento</b></sub></a> <a href="https://github.com/linkinn" title="Github">🚀</a>
