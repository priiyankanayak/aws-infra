#!/bin/bash
cd /home/ec2-user
touch .env
echo MYSQL_DATABASE="${MYSQL_DATABASE}" >> .env
echo MYSQL_USERNAME ="${MYSQL_USERNAME}" >> .env
echo MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}" >> .env
echo MYSQL_HOST="${MYSQL_HOST}" >> .env

echo PORT="3000" >> .env

echo AWS_S3_BUCKET_NAME="${AWS_S3_BUCKET_NAME}" >> .env
# echo NODE_ENV= "production" >> .env


sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
    -a fetch-config \
    -m ec2 \
    -c file:/home/ec2-user/cloudwatch.json \
    -s


sudo systemctl daemon-reload
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl enable web
sudo systemctl start web