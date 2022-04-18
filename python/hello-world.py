# https://docs.aws.amazon.com/ses/latest/dg/send-an-email-using-sdk-programmatically.html
# https://docs.aws.amazon.com/lambda/latest/dg/with-s3-example.html

import json
import urllib.parse
import boto3
import os
from botocore.exceptions import ClientError
print('Loading function')

s3 = boto3.client('s3')


def lambda_handler(event, context):
    # Extract ENV variables
    RECIPIENT_EMAIL = os.environ['email']
    SENDER_EMAIL = os.environ['email']
    AWS_REGION = os.environ['region']

    # Add SES email constants
    SUBJECT = "Infrastructure Update"
    CHARSET = "UTF-8"

    # Start SES client
    ses_client = boto3.client('ses',region_name=AWS_REGION)

    # Get the object from the event and show its content type
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'], encoding='utf-8')
    try:
        s3_notifcation = s3.get_object(Bucket=bucket, Key=key)
        print("Change Logs: " + key + " infra was modified")
        
        # Create body for email, using content type 
        BODY = "Change Logs: " + key + " infra was modified"
         #Provide the contents of the email.
        if(key == "terraform/keys/"):
           response = ses_client.send_email(
               Destination={
                   'ToAddresses': [
                       RECIPIENT_EMAIL,
                   ],
               },
               Message={
                   'Body': {
                       'Text': {
                           'Charset': CHARSET,
                           'Data': BODY,
                       },
                   },
                   'Subject': {
                       'Charset': CHARSET,
                       'Data': SUBJECT,
                   },
               },
               Source=SENDER_EMAIL
           )
           return response['ContentType']
        else:
            return None
    # Display an error if something goes wrong.	
    except ClientError as e:
        print(e.response['Error']['Message'])
    else:
        print("Email sent! Message ID:"),
        print(response['MessageId'])