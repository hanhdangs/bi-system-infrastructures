#!/usr/bin/env bash

set -euo pipefail

# enable debug
# set -x

echo "configuring credentials"
echo "==================="
aws configure set aws_access_key_id "local_key_id"
aws configure set aws_secret_access_key "local_access_key"
aws configure set region "ap-southeast-2"
aws configure list

echo "configuring sqs"
echo "==================="
LOCALSTACK_HOST=localhost

create_queue() {
    local QUEUE_NAME_TO_CREATE=$1
    aws --endpoint-url=http://${LOCALSTACK_HOST}:4566 sqs create-queue --queue-name ${QUEUE_NAME_TO_CREATE} --attributes VisibilityTimeout=30
}

create_queue "webworker-ap-southeast-2"

echo "get list of queues"
echo "==================="
aws --endpoint-url=http://${LOCALSTACK_HOST}:4566 sqs list-queues