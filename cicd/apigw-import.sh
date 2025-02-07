
https://stackoverflow.com/questions/39693597/how-to-set-use-lambda-proxy-integration-in-swagger-for-api-gateway

API swagger export:
API Gateway > APIs > [LambdaProxyAPI] > Stages, Stage actions -> Export
API specification type: Swagger
Format: YAML
Extensions: Export with AIP Gateway extensions



1. import apigw from swagger yaml:

aws apigateway import-rest-api --cli-binary-format raw-in-base64-out  --parameters endpointConfigurationTypes=REGIONAL --body file://LambdaProxyAPI-swagger.yml

{
    "id": "cp60pkyi0l",
    "name": "LambdaProxyAPI-2",
    "createdDate": "2024-09-06T09:26:21+00:00",
    "version": "2024-09-05T11:24:19Z",
    "apiKeySource": "HEADER",
    "endpointConfiguration": {
        "types": [
            "EDGE"
        ]
    },
    "disableExecuteApiEndpoint": false,
    "rootResourceId": "v4qt5i99g8"
}


2. deploy apigw

APIGW_API_NAME="LambdaProxyAPI-3"
APIGW_API_ID=$(aws apigateway get-rest-apis --query "items[?name == \`${APIGW_API_NAME}\`].id" --output text)
echo ${APIGW_API_ID}
aws apigateway create-deployment --rest-api-id ${APIGW_API_ID} --stage-name dev --stage-description 'Development Stage'


aws apigateway get-rest-apis --query 'items[].name'
aws apigateway create-deployment --rest-api-id 86j0u1rq18 --stage-name dev --stage-description 'Development Stage'


arn:aws:apigateway::588322030717::/restapis
arn:aws:apigateway:ap-northeast-1::/restapis
arn:aws:apigateway:ap-northeast-1::/restapis/5cxqpd89ge/deployments

APIGW_API_ID=
$(aws apigateway import-rest-api --cli-binary-format raw-in-base64-out --parameters endpointConfigurationTypes=REGIONAL --body file://cicd/apigw/LambdaProxyAPI-swagger.yml | grep "id" | awk -F',' '{print $1}' | cut -d ' ' -f6)

"0h52jysxni"

