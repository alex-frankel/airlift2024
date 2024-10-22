extension microsoftGraph

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' = {
  name: 'alfran-uami-airlift'
  location: resourceGroup().location
}

var uniqueName = 'alfranGroup'

resource group 'Microsoft.Graph/groups@v1.0' = {
  displayName: 'foobar'
  mailEnabled: false
  mailNickname: 'foobar123'
  securityEnabled: true
  uniqueName: uniqueName
  members: [
    uami.properties.principalId
  ]
}

// @description('Specifies the Reader role definition ID used in the role assignment.')
// param readerRoleDefinitionID string = 'acdd72a7-3385-48ef-bd42-f606fba81ae7'

// resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
//   name: guid(uniqueName, resourceGroup().id)
//   properties: {
//     principalId: group.id
//     roleDefinitionId: readerRoleDefinitionID
//   }
// }




