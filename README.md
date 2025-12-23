## Deploying the Infrastructure
- Create a private key from your aws account,
- create a folder inside your project directory called private-key
-  add the private key there.
-  Remember to add the privae-key folder to your .gitignore before pushing to github.
  
## Once the files are ready, we can deploy everything with three simple commands:
```
cd project-1
terraform init     # Initialize the project and download modules
terraform plan     # Preview the infrastructure that will be created
terraform apply    # Deploy it to AWS
```
## Verify the created services on the AWS console.
Check the clusters that actually exist in your account/region on your terminal:

```
aws eks list-clusters --region us-east-1
```
If the cluster exists, regenerate the kubeconfig so it has the correct endpoint

```
aws eks update-kubeconfig --name SAP-dev-eksdemo --region us-east-1
```
Then test

```
kubectl get nodes 
kubectl get pods -A
```
