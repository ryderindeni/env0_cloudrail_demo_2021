.PHONY: apply
apply:
	@cd terraform && AWS_PROFILE=indeni terraform apply --auto-approve

.PHONY: plan
plan:
	@cd terraform && AWS_PROFILE=indeni terraform plan

.PHONY: init
init:
	@cd terraform && AWS_PROFILE=indeni terraform init

.PHONY: test
test:
	@cd terraform && cloudrail run --auto-approve

.PHONY: destroy
destroy:
	@cd terraform && AWS_PROFILE=indeni terraform destroy
