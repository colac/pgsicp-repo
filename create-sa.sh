#!/bin/bash
## Make sure to have azure cli installed and perform 'az login' before executing the script
## This script creates the storage account that will keep the terraform tfstate files for the final project of PGSICP

RESOURCE_GROUP_NAME='pgsicp-rg'
STORAGE_ACCOUNT_NAME='pgsicpsa'
CONTAINER_NAME='container-tfstates'

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location northeurope

# Create storage account, cheapest and less redundant option LRS=Locally redundant storage
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME