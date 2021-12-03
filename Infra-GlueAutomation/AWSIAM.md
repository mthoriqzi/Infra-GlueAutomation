# AWS IAM

## List of Contents

1. [About the tool](#about-the-tool)
2. [Important learnings](#important-learnings)
3. [Navigating around the tool](#navigating-around-the-tool) 
    - [Policies](#policies) 
        - [AWSGlueConsoleFullAccess](/docs/AWSIAM.md#1.-AWSGlueConsoleFullAccess) 
        - [AmazonRDSReadOnlyAccess](/docs/AWSIAM.md#2.-AmazonRDSReadOnlyAccess) 
        - [AWSStepFunctionsFullAccess](/docs/AWSIAM.md#3.-AWSStepFunctionsFullAccess)
        - [AmazonSageMakerFullAccess](/docs/AWSIAM.md#4.-AmazonSageMakerFullAccess)
        - [AwsGlueDataBrewDataResourcePolicy](/docs/AWSIAM.md#5.-AwsGlueDataBrewDataResourcePolicy)
        - [AWSLakeFormationDataAdmin & AWSLakeFormationCrossAccountManager](/docs/AWSIAM.md#6.-AWSLakeFormationDataAdmin & AWSLakeFormationCrossAccountManager)
        - [AmazonAthenaFullAccess ](/docs/AWSIAM.md#7.-AmazonAthenaFullAccess )


## About the tool

**AWS IAM** (Identity and Access Management) is a web service that helps you securely control access to AWS resources. You use IAM to control who is authenticated (signed in) and authorized (has permissions) to use resources.

## IAM Features
1. AWS IAM can grant other people permission to administer and use resources in your AWS account without having to share your password or access key.
2. Secure access to AWS resources for applications that run on Amazon EC2, You can use IAM features to securely provide credentials for applications that run on EC2 instances. These credentials provide permissions for your application to access other AWS resources. 
3. Multi-factor authentication (MFA), You can add two-factor authentication to your account and to individual users for extra security. With MFA you or your users must provide not only a password or access key to work with your account, but also a code from a specially configured device.
4. Identity federation, You can allow users who already have passwords elsewhere—for example, in your corporate network or with an internet identity provider—to get temporary access to your AWS account, and can be integrated with many AWS services.
5. Free to use, AWS Identity and Access Management (IAM) is one of many features of your AWS account offered at no additional charge. You are charged only when you access other AWS services using your IAM users credentials.

## Navigating around the tool

![AWS IAM Console](/references/iam.jpeg)
The main page of AWS IAM Console looks like this (2021/11). As seen on the left side of the picture, currently we are on the Acces management - Users. The left pane is an overview of the available menu/pages in AWS IAM , which can be seen
to be divided into two main menus: **Access management** and **Access reports**. How to grant User with spesific access in an overview --  we need add new user by click "add user" button in User menu, name the user as needed, determine type 
of the account is it programmatic access only or AWS management console access, and attach spesific policies as needed.

Create User with spesific permission:
1. Sign in to the AWS Management Console and open the IAM console at https://console.aws.amazon.com/iam/.
2. In the left navigation pane, choose User.
3. Choose "Add User".
4. Choose type of the account between  programmatic access only, AWS management console access, or both of them.
5. Attach policies

### Policies

You manage access in AWS by creating policies and attaching them to IAM identities (users, groups of users, or roles) or AWS resources. A policy is an object in AWS that, when associated with an identity or resource, defines their permissions.
Permissions in the policies determine whether the request is allowed or denied. Most policies are stored in AWS as JSON documents.IAM policies define permissions for an action regardless of the method that you use to perform the operation. For example, if a policy allows the GetUser action, then a user with that policy can get user information from the AWS Management Console, the AWS CLI, or the AWS API.
Some policies that used in this project will be explained in this section.

#### 1. AWSGlueConsoleFullAccess

This policy grants permission for some Amazon S3 actions to manage resources in your account that are needed by AWS Glue when it assumes the role using 
this policy. Some of the resources that are specified in this policy refer to default names that are used by AWS Glue for Amazon S3 buckets, Amazon S3 
ETL scripts, CloudWatch Logs, and Amazon EC2 resources.


#### 2. AmazonRDSReadOnlyAccess

With IAM identity-based policies, you can specify allowed or denied actions and resources as well as the conditions under which actions are allowed or denied.
Amazon RDS supports specific actions, resources, and condition keys. This policy allow user to acces dms data in the RDS.


#### 3. AWSStepFunctionsFullAccess 

AWS Step Functions can execute code and access AWS resources (such as invoking an AWS Lambda function). To maintain security, you must grant Step Functions access 
to those resources by using an IAM role.


#### 4. AmazonSageMakerFullAccess 

Grants full access to Amazon SageMaker resources and the supported operations. This does not provide unrestricted Amazon S3 access, but supports buckets and objects
with specific sagemaker tags. This policy allows all IAM roles to be passed to Amazon SageMaker, but only allows IAM roles with “AmazonSageMaker” in 
them to be passed to the AWS Glue, AWS Step Functions, and AWS RoboMaker services.


#### 5. AwsGlueDataBrewDataResourcePolicy 

The AwsGlueDataBrewDataResourcePolicy policy grants the permissions needed to connect to data and to configure DataBrew.


#### 6. AWSLakeFormationDataAdmin & AWSLakeFormationCrossAccountManager

Allows the data lake administrator to conduct administrative operations and view AWS CloudTrail logs and Allows the principal to grant Lake Formation permissions to external AWS accounts, to organizations, or to organizational units.

#### 7. AmazonAthenaFullAccess 

The AmazonAthenaFullAccess managed policy grants full access to Athena resources. 






