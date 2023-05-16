# Variables para la implementación
$resourceGroupName = "appservicesplan-02-arm"
$storageAccountName = "mystorageaccount04arm"
$appServicePlanName = "prueba-02-arm"
$appService1Name = "prueba-web-01"
$appService2Name = "prueba-web-02"
$location = "eastus"
$templateFilePath = "C:\Users\migue\Desktop\Miguel\Dev_Arroyo\tarea2\Arm\AppServicesPlan_01_ARM.json"

# Crear el grupo de recursos
New-AzResourceGroup `
    -Name $resourceGroupName `
    -Location $location 

# Crear el plan de servicio de aplicaciones
New-AzAppServicePlan `
    -ResourceGroupName $resourceGroupName `
    -Name $appServicePlanName `
    -Location $location `

# Implementar la plantilla ARM
New-AzResourceGroupDeployment `
    -Name "new-appservicesplan-02-arm" `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFilePath `
    -storageAccountName $storageAccountName `
    -appServicePlanName $appServicePlanName `
    -appService1Name $appService1Name `
    -appService2Name $appService2Name `

# Obtener el identificador del plan de servicio de aplicaciones creado
$appServicePlan = Get-AzAppServicePlan `
    -ResourceGroupName $resourceGroupName `
    -Name $appServicePlanName

$appServicePlanId = $appServicePlan.Id `

# Mostrar el identificador del plan de servicio de aplicaciones creado
Write-Output "Plan de servicio de aplicaciones creado con éxito con el ID: $($appServicePlanId)"

