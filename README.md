# cats

This is an example project for k8s. It consists of terraform code and helm chart that installs and configures nginx.

## Terraform

Requirements:
- [ ] provision an EC2 instance in the default VPC (create a security group and an instance)
- [ ] install [minikube](https://minikube.sigs.k8s.io/docs/start/) on the EC2 instance using [user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)
- [ ] retrieve credentials to access minicube and save them as terraform outputs ([ ] bonus: add credentials to `~/.kube/config`)

## helm chart

Requirements:
- [ ] install nginx on the minikube via helm chart
- [ ] create an ingress on port 443 that answers to a configurable hostname (oremennik.example)
- [ ] test with the ingress with cURL using parameter `-H 'Host: oremennik.example'`
- [ ] create a config map to minikube with a photo of a cat
- [ ] create `index.html` that renders the image of the cat
- [ ] add `index.html` to the config map with the cat
- [ ] configure nginx to serve the contents of the config map as files by mounting the config map inside the nginx pod
- [ ] test the output with `cURL`
