#!/bin/bash
set -euo pipefail

check_awscli () {
	 if ! command -v aws &> /dev/null; then
                echo "AWS CLI is not installed. Please install it first." >&2
                return 1
         fi

}

install_awscli () {
	
	echo "your aws cli is getting installed"
	
	curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    	sudo apt-get install -y unzip &> /dev/null
    	unzip -q awscliv2.zip
    	sudo ./aws/install

	aws --version

	rm -rf awscliv2.zip ./aws

}

ec2_create () {

	local ami_id="$1"
	local instance_type="$2"
	local key_name="$3"
	local subnet_id="$4"
	local security_group_ids="$5"
    	local instance_name="$6"

	instance_id=$(aws ec2 run-instances \
		--image-id "$ami_id" \
		--intace-type "$instance_type" \
		--key-name "$key_name" \
		--subnet-id "$subnet_id" \
		--security_group_ids "$security_group_id" \
		--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" \
        	--query 'Instances[0].InstanceId' \
        	--output text
		)
 	if [[ -z $instance_id ]]; then
		echo "failed to create ec2 intance" >&2
		exit 1
	fi

	echo "instance $instance_id created"

	wait_for_instance "$instance_id"
	
}

wait_for_instance() {
    local instance_id="$1"
    echo "Waiting for instance $instance_id to be in running state..."

    while true; do
        state=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[0].Instances[0].State.Name' --output text)
        if [[ "$state" == "running" ]]; then
            echo "Instance $instance_id is now running."
            break
        fi
        sleep 10
    done
}



main() {
	if ! check_awscli; then
		install_awscli || exit 1
	fi

	echo "creating ec2 instance"

	 AMI_ID=""
    	 INSTANCE_TYPE="t2.micro"
    	 KEY_NAME=""
    	 SUBNET_ID=""
    	 SECURITY_GROUP_IDS=""  # Add your security group IDs separated by space
    	 INSTANCE_NAME="Shell-Script-EC2-Demo"

	ec2_create "AMI_ID" "INSTANCE_TYPE" "KEY_NAME" "SUBNET_ID" "SECURITY_GROUP_IDS" "INSTANCE_NAME"

	echo "ec2 instance created!"

}

main "$@"


