@secure()
param appServicePlanName string
param appService1Name string 
param appService2Name string 
param storageAccountName string 
param containerName string 
param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    supportsHttpsTrafficOnly: true
  }
  tags: {
    environment: 'dev'
  }
}

resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2021-04-01' = {
  name: 'default'
  parent: storageAccount
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  name: containerName
  parent: blobService
  properties: {}
}

resource appService1 'Microsoft.Web/sites@2021-02-01' = {
  name: appService1Name
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
        }
      ]
    }
  }
}

resource appService2 'Microsoft.Web/sites@2021-02-01' = {
  name: appService2Name
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
        }
      ]
    }
  }
}
  
output appServicePlanResourceId string = appServicePlan.id
output appService1ResourceId string = appService1.id
output appService2ResourceId string = appService2.id
output storageAccountId string = storageAccount.id
output containerId string = container.id
