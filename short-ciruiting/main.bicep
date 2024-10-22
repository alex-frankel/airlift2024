resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: uniqueString('alfran', resourceGroup().id)
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

module shortCircuitTest 'mod.bicep' = {
  params: {
    // dynamicTag: 'nonDynamicValue' // no short circutiing
    dynamicTag: storage.properties.primaryEndpoints.blob // will short circuit
  }
}
