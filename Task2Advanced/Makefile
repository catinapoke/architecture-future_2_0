# Ключи Object Storage (S3-совместимый backend).
# Экспортируйте ACCESS_KEY и SECRET_KEY перед make init.

# Публичный SSH-ключ для metadata ВМ. В CI задаётся секретом TF_VAR_SSH_KEY.
export TF_VAR_ssh_key ?= ubuntu:$(shell cat $(HOME)/.ssh/cloudru.pub)

TFVARS := ./envs/dev/terraform.tfvars

init:
	terraform init -backend-config="access_key=$(ACCESS_KEY)" -backend-config="secret_key=$(SECRET_KEY)"

plan:
	terraform plan -var-file=$(TFVARS)

apply:
	terraform apply -var-file=$(TFVARS)

destroy:
	terraform destroy -var-file=$(TFVARS)
