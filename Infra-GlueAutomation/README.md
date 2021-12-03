# Introduction 
This module is used for automate Glue resources deployment on top of terraform, and run a glue crawler remotely using AWS CLI making it possible to operate some glue resources directly from Azure DevOps using azure pipeline. Glue Resources that created in this module are glue catalog database, glue connection, lake formation data permission, and glue crawler. This module consist of 3 terraform files (.tf) and 1 yaml file  :



1.  main.tf : main terraform source code to deploy aws resources  
2.  variable.tf : contains definition of the variables used in main.tf
3.  backend.tf : configuration to store terraform state into S3 bucket
4.  GlueAutomation-pipeline.yml : pipeline configuration to deploy all terraform files using command terraform init, plan, and apply that integrated with aws credentials



# Requirements: 

| Name          | Version       | 
| ------------- |:-------------:| 
| terraform      | >= 0.13.0 |
| aws CLI   | >= 2 |
 
# Resource 

| Name          | Type       | 
| ------------- |:-------------:| 
| aws_glue_catalog_database      | Resource |
| aws_glue_connection      | Resource |
| aws_lakeformation_permissions      | Resource |
| aws_glue_crawler      | Resource |
| aws_rds      | Datasource |

 

# Input

| Name          | Description   | 
| ------------- |:-------------:| 
| glue_database      |name of the distributor in the RDS that will be used  |

 


# Deploy 
Run the Infra-GlueAutomation pipeline and input the glue database name as in the RDS.
