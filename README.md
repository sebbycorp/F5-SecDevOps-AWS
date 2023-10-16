# F5-SecDevOps-AWS
The following F5 environment is used to test out security features on an f5 in aws.


* Need to subscibe to F5 first https://aws.amazon.com/marketplace/pp/prodview-nlakutvltzij4


certbot certonly \
  --dns-route53 \
  -d maniak.academy \
  -d securedemo.maniak.academy
