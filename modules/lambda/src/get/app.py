import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def handle(event, context):
    logging.info(json.dumps(event, indent=2))
    logging.info(f"Lambda function ARN: {context.invoked_function_arn}")
    logging.info(f"CloudWatch log stream name: {context.log_stream_name}")
    logging.info(f"CloudWatch log group name:  {context.log_group_name}")
    logging.info(f"Lambda Request ID: {context.aws_request_id}")
    logging.info(f"Lambda function memory limits in MB: {context.memory_limit_in_mb}")

    event_object = {
        "functionName": context.function_name,
        "xForwardedFor": event["headers"]["X-Forwarded-For"],
        "method": event["requestContext"]["httpMethod"],
        "rawPath": event["requestContext"]["path"],
        "queryString": event["queryStringParameters"],
        "timestamp": event["requestContext"]["requestTime"]
    }

    if event["requestContext"]["httpMethod"] == "POST":

        event_object["body"] = event["body"]
        return {
            "statusCode": 200,
            "headers": {
                "Content-Type": "application/json"
            },
            "body": json.dumps({
                "message ": event_object
            })
        }
    else:
        return {
            "statusCode": 200,
            "headers": {
                "Content-Type": "application/json"
            },
            "body": json.dumps({
                "message ": event_object
            })
        }
