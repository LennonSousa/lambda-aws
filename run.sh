# 1º passo: criar arquivo de políticas de segurança.
# 2º passo: criar role de segurança na AWS.

aws iam create-role \
--role-name lambda-exemplo \
--assume-role-policy-document file://policies.json --profile lennon

# 3º passo: criar arquivo com o código e zipá-lo.

aws lambda create-function \
--function-name hello-cli \
--zip-file fileb://index.zip \
--handler index.handler \
--runtime nodejs18.x \
--role arn:aws:iam::853108577771:role/lambda-exemplo

# 4º passo: invocar lambda.
aws lambda invoke \
--function-name hello-cli \
--log-type Tail \
logs/lambda-exec.log

# 5º passo: remover.
aws lambda delete-function \
--function-name hello-cli

aws iam delete-role \
--role-name lambda-exemplo