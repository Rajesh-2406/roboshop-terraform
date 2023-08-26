dev:
	@rm -rf .terraform
	@git pull
	@terraform	init
	@terraform	apply	-auto-approve	-var-file=env-dev/main.tfvars

dev-destroy:
	@rm -rf .terraform
	@git pull
	@terraform	init
	@terraform	destroy	-auto-approve	-var-file=env-dev/main.tfvars


prod:
	@rm -rf .terraform
	@git pull
	@terraform	init
	@terraform apply -auto-approve	-var-file=env-prod/main.tfvars

prod-destroy:
	@rm -rf .terraform
	@git pull
	@terraform	init
	@terraform	destroy	-auto-approve	-var-file=env-prod/main.tfvars
