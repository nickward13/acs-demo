# Create acsrg resource group
az group create --name acsrg --location australiasoutheast

# Create Azure Container Service cluster
az acs create --name acs-cluster --resource-group acsrg --dns-prefix hect --generate-ssh-keys --orchestrator-type kubernetes

# Install kubernetes cli if needed
# az acs kubernetes install-cli

# Get master kubernetes cluster configuration file
az acs kubernetes get-credentials --resource-group acsrg --name acs-cluster

# Run a Container
kubectl run simpleaspnetcoreapp --image hectagon/demos:simpleaspnetcoreapp

# See container running
kubectl get pods

# Expose container on the Azure load balancer
kubectl expose deployments simpleaspnetcoreapp --port=80 --target-port=5000 --type=LoadBalancer

# verivy public ip address assigned to Service
kubectl get svc