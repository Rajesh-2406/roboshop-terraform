dev:
	@rm -rf .terraform
	@terraform	init
	@terraform	apply	-auto-approve	-var-file=env-dev/main.tfvars

dev-destroy:
	@rm -rf .terraform
	@terraform	init
	@terraform	destroy	-auto-approve	-var-file=env-dev/main.tfvars


prod:
	@rm -rf .terraform
	@terraform	init
	@terraform apply -auto-approve	-var-file=env-prod/main.tfvars