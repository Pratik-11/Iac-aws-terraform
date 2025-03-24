#!/bin/bash

VPC_ID="vpc-05e4cf150736b33f8"

echo "🔍 Fetching resources for VPC: $VPC_ID"

# Step 1: Delete Subnets
echo "🚀 Deleting Subnets..."
SUBNET_IDS=$(aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC_ID" --query "Subnets[*].SubnetId" --output text)
for SUBNET_ID in $SUBNET_IDS; do
  echo "🗑️ Deleting Subnet: $SUBNET_ID"
  aws ec2 delete-subnet --subnet-id $SUBNET_ID
done

# Step 2: Delete NAT Gateways (if any)
echo "🚀 Deleting NAT Gateways..."
NAT_GATEWAYS=$(aws ec2 describe-nat-gateways --filter "Name=vpc-id,Values=$VPC_ID" --query "NatGateways[*].NatGatewayId" --output text)
for NAT_GW in $NAT_GATEWAYS; do
  echo "🗑️ Deleting NAT Gateway: $NAT_GW"
  aws ec2 delete-nat-gateway --nat-gateway-id $NAT_GW
  sleep 10  # Wait for deletion
done

# Step 3: Detach and Delete Internet Gateway
echo "🚀 Detaching and Deleting Internet Gateways..."
IGW_IDS=$(aws ec2 describe-internet-gateways --filters "Name=attachment.vpc-id,Values=$VPC_ID" --query "InternetGateways[*].InternetGatewayId" --output text)
for IGW_ID in $IGW_IDS; do
  echo "🔌 Detaching and deleting IGW: $IGW_ID"
  aws ec2 detach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
  aws ec2 delete-internet-gateway --internet-gateway-id $IGW_ID
done

# Step 4: Remove Route Table Associations
echo "🚀 Disassociating Route Tables..."
ROUTE_TABLES=$(aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$VPC_ID" --query "RouteTables[*].RouteTableId" --output text)
for RTB_ID in $ROUTE_TABLES; do
  echo "🗑️ Removing routes from Route Table: $RTB_ID"
  aws ec2 delete-route-table --route-table-id $RTB_ID || echo "⚠️ Cannot delete main route table"
done

# Step 5: Delete Security Groups (except default)
echo "🚀 Deleting Security Groups..."
SECURITY_GROUPS=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$VPC_ID" --query "SecurityGroups[?GroupName!='default'].GroupId" --output text)
for SG_ID in $SECURITY_GROUPS; do
  echo "🗑️ Deleting Security Group: $SG_ID"
  aws ec2 delete-security-group --group-id $SG_ID
done

# Step 6: Delete the VPC
echo "🚀 Deleting VPC: $VPC_ID"
aws ec2 delete-vpc --vpc-id $VPC_ID

echo "✅ VPC Deletion Completed!"
