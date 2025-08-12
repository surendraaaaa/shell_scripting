#!bin/bash

<< comment

This is deployment of Django App
This Script will handle errors gracefully while depoying app

comment

code_clone() {

	echo"cloning the App using Github"
	git clone https://github.com/LondheShubham153/django-notes-app.git

}

install_req() {

	echo "Installing depedencies"
	sudo apt-get update
	sudo apt-get install docker.io nginx -y docker-compose

}

required_restart() {
 	sudo chown -R $USER:$USER /home/n01521961/shell_scripting/error_handling/django-notes-app/data/mysql/db/ #optional for local testing
	sudo chown $USER /var/run/docker.sock
	#sudo systemctl enable docker
	#sudo systemctl enable nginx
	#sudo systemctl restart docker
}

deploy() {

	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
	docker-compose up -d

}

echo "you are deployin; wait for the thing"

if ! code_clone; then
	echo "Code exits already; redirecting to the directory"
	cd django-notes-app
fi

if ! install_req; then
	echo "Fail to install"
	exit 1
fi

if ! required_restart; then
	echo "System error; please check your code again!"
	exit 1
fi

if ! deploy; then
	echo "deployment failed, sending email to the host"
	#sendmail
	exit 1
fi

echo "you deployed!!"



