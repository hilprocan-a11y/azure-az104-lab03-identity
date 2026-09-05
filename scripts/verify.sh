#!/usr/bin/env bash
set -euo pipefail
rg="${1:-rg-hn-az104-lab03-identity}"
az account show --query '{Account:user.name,Subscription:name,Tenant:tenantId}' -o table
az role assignment list --resource-group "$rg" --include-inherited --query '[].{Identity:principalName,Role:roleDefinitionName,Scope:scope}' -o table
az ad group member list --group GRP-Azure-Operators --query '[].{Name:displayName,Account:userPrincipalName}' -o table
az group show --name "$rg" --query tags -o json
az deployment group show --resource-group "$rg" --name lab03-rbac-bicep --query '{Name:name,State:properties.provisioningState}' -o table
