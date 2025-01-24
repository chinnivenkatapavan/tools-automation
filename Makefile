infra:
	git pull
	terraform init -backend-config=./vm-module/state.tfvars -var ssh_username=pavan -var ssh_password=Devops@123456
	terraform apply -auto-approve -var ssh_username=pavan -var ssh_password=Devops@123456
# Username and Password should not be hardcoded, Here we just hardcoding because to avoid the passing of input. This needs to be parsed as input in real time

ansible:
	git pull
	ansible-playbook -i $(tool_name)-internal.azdevops2704.online, -e ansible_user=pavan -e ansible_password=Devops@123456 -e tool_name=$(tool_name) tool-setup.yml
## Username and Password should not be hardcoded, Here we just hardcoding because to avoid the passing of input. This needs to be parsed as input in real time
