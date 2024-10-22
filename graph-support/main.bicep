targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-08-01' = {
  name: 'airlift2024'
  location: deployment().location
}

module graphDeploy 'groups.bicep' = {
  scope: rg
}
