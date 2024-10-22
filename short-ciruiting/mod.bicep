param dynamicTag string

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'alfran-test'
  location: resourceGroup().location
  tags: {
    test: dynamicTag
  }
}
