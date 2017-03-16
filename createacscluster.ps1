# Create acsrg resource group
az group create --name acsrg --location australiasoutheast

# Create Azure Container Service cluster
az acs create --name acs-cluster --resource-group acsrg --dns-prefix hect --generate-ssh-keys --orchestrator-type swarm
