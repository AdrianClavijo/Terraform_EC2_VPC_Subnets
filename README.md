## Needed Terraform Commands


1. Install modules and initiate terraform

```sh
terraform init
```

2. Inside the container, architecture plan

```sh
terraform plan -out main.tfplan
```

3. Apply architecture plan

```sh
terraform apply main.tfplan
```
---

### Check SSH and Ping from Public EC2 to Private EC2