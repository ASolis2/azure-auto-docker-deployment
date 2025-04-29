#!/bin/bash

# =====================
# Azure Auto Server Deployment with Docker
# Author: Anthony Solis
# =====================

# Variables
RESOURCE_GROUP="DockerRG"
LOCATION="eastus"
VNET_NAME="DockerVNet"
SUBNET_NAME="DockerSubnet"
NSG_NAME="DockerNSG"
PUBLIC_IP_NAME="DockerPublicIP"
NIC_NAME="DockerNIC"
VM_NAME="DockerVM"
USERNAME="solis"    # <-- change this if needed
PASSWORD="OmniGreen24?!?!"   # <-- must meet Azure requirements

# Login to Azure (if not already logged in)
az account show > /dev/null 2>&1
if [ $? != 0 ]; then
    az login
fi

# Create Resource Group
echo "Creating resource group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create Virtual Network
echo "Creating virtual network..."
az network vnet create --resource-group $RESOURCE_GROUP --name $VNET_NAME --subnet-name $SUBNET_NAME

# Create Network Security Group and rules
echo "Creating network security group..."
az network nsg create --resource-group $RESOURCE_GROUP --name $NSG_NAME

echo "Creating NSG rules for SSH and HTTP..."
az network nsg rule create --resource-group $RESOURCE_GROUP --nsg-name $NSG_NAME --name AllowSSH --priority 1000 --access Allow --protocol Tcp --destination-port-range 22 --direction Inbound
az network nsg rule create --resource-group $RESOURCE_GROUP --nsg-name $NSG_NAME --name AllowHTTP --priority 1010 --access Allow --protocol Tcp --destination-port-range 80 --direction Inbound

# Create Public IP
echo "Creating public IP address..."
az network public-ip create --resource-group $RESOURCE_GROUP --name $PUBLIC_IP_NAME

# Create Network Interface
echo "Creating network interface..."
az network nic create --resource-group $RESOURCE_GROUP --name $NIC_NAME --vnet-name $VNET_NAME --subnet $SUBNET_NAME --network-security-group $NSG_NAME --public-ip-address $PUBLIC_IP_NAME

# Create Virtual Machine
echo "Creating virtual machine..."
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --nics $NIC_NAME \
  --image Ubuntu2204 \
  --admin-username $USERNAME \
  --admin-password $PASSWORD \
  --authentication-type password \
  --size Standard_B1s


# Output Public IP
echo "Getting public IP address..."
az vm list-ip-addresses --resource-group $RESOURCE_GROUP --name $VM_NAME --output table

echo "Deployment Complete!"

