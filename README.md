# aws-sam-lambda

This is an experimental repository, a number of scripts will help you to build and deploy a serverless application to AWS or to localstack.

This serverless application contains:

* An API endpoint
* A lambda that responds to the API endpoint
* An SQS queue
* An SNS topic
* A lambda that reads from the SQS queue and posts to an SNS topic

## HelloWorldFunction

This actually contains 2 lambda functions:

* `ApiGatewayrespondingApp` - responds to `GET` method at an http endpoint.
* `QueueIOApp` - copies SQS queue messages into an SNS topic.

## Prerequisites

Assumed, you already have Docker installed.

* `install-prerequisites-aws-sam-cli.sh`
* `install-prerequisites-localstack-cli.sh`

## Invoke a lambda locally (without localstack)

Build, and test by providing a custom event, with `sam local invoke`:

```bash
sam build
sam local invoke HelloWorldFunction --event events/event.json
```

To emulate the API, use `sam local start-api`. It'll run on port 3000:

```bash
sam local start-api
curl http://localhost:3000/
```

## Build and deploy to AWS

Either, install and use the [AWS Toolkit](https://docs.aws.amazon.com/toolkit-for-jetbrains/latest/userguide/welcome.html)
which provides an Deploy Serverless Application option, or:

* `deploy-remote.sh`

This will offer a guided deployment, and save configuration to: `samconfig.toml`

## Build and deploy to localstack

* `start-localstack.sh`
* `deploy-localstack.sh`

## Logs

Tail remote logs with `sam logs`:

```bash
sam logs -n QueueIOFunction --stack-name aws-sam-lambda --tail
```

## Build

```bash
cd HelloWorldFunction
gradle build
```

or

```bash
sam build
```

## Testing

```bash
cd HelloWorldFunction
gradle test
```

## Cleanup

To delete the sample application that you created, use the AWS CLI. Assuming you used your project name for the stack name, you can run the following:

```bash
aws cloudformation delete-stack --stack-name aws-sam-lambda
```
