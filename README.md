## Deploying the Infrastructure
-  Once the files are ready, we can deploy everything with three simple commands

## Project-1 creates the vpc and EKS cluster. Create this first.

```
cd project-1
terraform init     # Initialize the project and download modules
terraform plan     # Preview the infrastructure that will be created
terraform apply    # Deploy it to AWS
```

## Project-2 installs EBS CSI Driver using HELM. Create the vpc first. [README.md link](https://github.com/Michael-Otieno/terraform-aws-eks-cluster/blob/main/project-2/README.md)


## Verify the created services on the AWS console.
Check the clusters that actually exist in your account/region on your terminal:

```
aws eks list-clusters --region us-east-1
```

If the cluster does not exist, regenerate the kubeconfig so it has the correct endpoint


```
aws eks update-kubeconfig --name SAP-dev-eksdemo --region us-east-1
```
Then test

```
kubectl get nodes 
kubectl get pods -A
```
