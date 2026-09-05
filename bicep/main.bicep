targetScope = 'resourceGroup'

@description('Object ID of the existing NAIT guest user.')
param guestPrincipalId string

@description('Object ID of the existing operators group.')
param operatorsGroupId string

// Preserve the names of the assignments created through the portal.
param readerAssignmentName string
param contributorAssignmentName string

var readerRoleId = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'acdd72a7-3385-48ef-bd42-f606fba81ae7')
var contributorRoleId = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b24988ac-6180-42a0-ab88-20f7382dd24c')

resource guestReader 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: readerAssignmentName
  properties: {
    principalId: guestPrincipalId
    principalType: 'User'
    roleDefinitionId: readerRoleId
  }
}

resource operatorsContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: contributorAssignmentName
  properties: {
    principalId: operatorsGroupId
    principalType: 'Group'
    roleDefinitionId: contributorRoleId
  }
}

output readerAssignmentId string = guestReader.id
output contributorAssignmentId string = operatorsContributor.id

