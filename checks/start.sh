#!/bin/sh
# The starting user's access key works (it authenticates as ctf-starting-user), and the shared
# services of the challenges (SNS topics, SQS queues) exist.
set -eu
arn=$(env -u AWS_SESSION_TOKEN -u AWS_PROFILE -u AWS_CREDENTIAL_EXPIRATION \
  AWS_ACCESS_KEY_ID="$ISOLOOM_OUTPUT_ACCESS_KEY_ID" AWS_SECRET_ACCESS_KEY="$ISOLOOM_OUTPUT_SECRET_KEY" \
  aws sts get-caller-identity --query Arn --output text)
case "$arn" in */ctf-starting-user) ;; *) echo "the key authenticates as $arn" >&2; exit 1 ;; esac
aws sns list-topics --query 'Topics[].TopicArn' --output text | grep -q user-updates-topic
aws sqs list-queues --query 'QueueUrls' --output text | grep -q process_orders
