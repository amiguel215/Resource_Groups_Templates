# Definir variables
$resourceGroupName = "appservicesplan-01-B"

# Cargar valores de parámetros desde el archivo JSON
$params  = Get-Content -Path "C:\Users\migue\Desktop\Miguel\Dev_Arroyo\tarea2\Bicep\App_Services_Plan_01_B.json" | ConvertFrom-Json
Get-Content -Path "C:\Users\migue\Desktop\Miguel\Dev_Arroyo\tarea2\Bicep\App_Services_Plan_01_B.json"
# $params = ConvertFrom-Json -InputObject $jsonContent
$params | Format-List *

New-AzResourceGroup `
    -Name $resourceGroupName -Location $params.parameters.location.value

# Crear objeto de parámetros para la plantilla
# $params = @{
#     "appServicePlanName" = $appServicePlanName
#     "appService1Name" = $appService1Name
#     "appService2Name" = $appService2Name
#     "storageAccountName" = $storageAccountName
#     "containerName" = $containerName
# }

# Implementar la plantilla Bicep
$deploymentName = "my-bicep-deployment"
$TemplateFile = "C:\Users\migue\Desktop\Miguel\Dev_Arroyo\tarea2\Bicep\App_Services_Plan_01_B.bicep"
$TemplateParameterFile = "C:\Users\migue\Desktop\Miguel\Dev_Arroyo\tarea2\Bicep\App_Services_Plan_01_B.json"

New-AzResourceGroupDeployment `
    -Name $deploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $TemplateParameterFile `
    # -TemplateParameterObject $params.parameters `