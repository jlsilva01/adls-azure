## Criando Azure Data Lake Storage no Azure gratuito - Sem cartão de crédito
#### Disclaimer: Utilizar somente para fins de estudo e testes da tecnologia

### Pré-requisitos:

- [Azure CLI](https://learn.microsoft.com/pt-br/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Terraform](https://www.terraform.io/downloads)
- Conta Microsoft específica para esta atividade


### Roteiro:

1. Ativar uma assinatura de testes [MS Learn Sandbox (Area Restrita)](https://learn.microsoft.com/pt-br/training/modules/develop-test-deploy-azure-functions-with-core-tools/5-exercise-publish-function-core-tools?ns-enrollment-type=learningpath&ns-enrollment-id=learn.create-serverless-applications) - Concierge Subscription (4 hora de duração) - 
2. Efetuar o login no Azure através do Azure CLI.
```bash  copy
az login
```
3. Conferir sua assinatura atual.
```bash copy
az account show -o table
```
4. Listar todas as assinaturas do Azure da sua conta Microsoft, utilize o comando abaixo (troque o e-mail abaixo pelo e-mail da sua conta Azure).
```bash  copy
az account list --query "[?user.name=='jlsilva01@yahoo.com.br'].{Name:name, ID:id, Default:isDefault}" -o table
```
5. Utilizar a assinatura gratuita, ativada no item 1 deste.
```bash  copy
az account set --subscription "Concierge Subscription"
```
6. Consultar o nome do Resource Group criado para a sua conta do Concierge Subscription.
```bash copy
az group list -o table
```
7. Ajustar a variável *resource_group_name* do arquivo `variables.tf` com o nome do Resource Group informado no passo anterior.
```terraform
variable "resource_group_name" {
  default = "learn-877e311a-66ab-401b-9372-06326c9bd083"
}
```

8. Criar os recursos na assinatura Azure selecionada.
```bash copy
terraform init
```
```bash copy
terraform validate
```
```bash copy
terraform fmt
```
```bash copy
terraform plan
```
```bash copy
terraform apply
```
9. Logar no [portal.azure.com](https://portal.azure.com/) e conferir o deploy do ADLS.
10. Destruir os recursos criados.
```bash copy
terraform destroy
```

<b>Nota:</b> Caso queira usar o `apply` e `destroy` sem a necessidade confirmação, você pode usar a tag `-auto-approve` (use com bastante cuidado!).