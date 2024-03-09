# Kubernetes Deployment Automation with Ansible

This project automates the deployment of a simple Python Flask application with a API and JFrog Artifactory on Kubernetes Kind using Ansible. After running the script you will have a local JFrog Artifactory and a API endpoint based of Flask running on top of an Nginx Ingress controller.

## Prerequisites

To use this script, you simply need a machine with Ansible installed and a target computer where you wish to deploy the project.

## Usage

After executing the following command:

```bash
ansible-playbook deploy.yaml 
```
You will get two outcomes:

1. JFrog Artifactory Deployment: Accessible at the URL tomer-jfrog.octopus.lab. To log in, use the username admin and the password password.

2. Flask API Deployment: A Flask API will be accessible at the URL tomer-flask.octopus.lab/api/message, providing a simple JSON response.

For downloading an image from the Artifactory, you can use the docker-image-setup.yaml file, ensuring that the vault.txt file contains the appropriate repository credentials.


## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for any improvements or bug fixes.


## License

[MIT](https://choosealicense.com/licenses/mit/)
