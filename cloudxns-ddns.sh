#!/bin/sh
#====================================================================
# Name: cloudxns-ddns
# Description: A shell script for CloudXNS DDNS
# Usage: Fill in the blanks and run
# Version: 0.0.1
# Website: https://github.com/Rmcsy/cloudxns-ddns
#====================================================================

# API KEY
# e.g. API_KEY="af0b62d0e4b5898587dde0ea6fddd97e"
API_KEY=""

# SECRET KEY
# e.g. SECRET_KEY="28c9ca6aa33241e6"
SECRET_KEY=""

# DOMAIN NAME 
# e.g. DOMAIN="example.com"
# or   DOMAIN="www.example.com"
DOMAIN=""

# IP Adress
# e.g. IP=""                : Autodetect public IP. [Recommend].
# or   IP="1.2.3.4"         : Single IP
# or   IP="1.2.3.4|2.2.3.4" : Several IPs separated by "|"
IP=""

# Users have NO NEED to look down.
#====================================================================


# TO DO: comments
# See: CloudXNS_api2.0_doc_zh-cn
LINE_ID=""
API_FORMAT=""
API_REQUEST_DATE="$(date -R)"
URL="https://www.cloudxns.net/api2/ddns"

# Genaral key-value form
DOMAIN_DATA="\"domain\":\"${DOMAIN}\""
if [ ${IP} ];then
    IP_DATA=",\"ip\":\"${IP}\""
else
    IP_DATA=""
fi

if [ ${LINE_ID_DATA} ];then
    LINE_ID_DATA=",\"line_id\":\"${LINE_ID}\""
else
    LINE_ID_DATA=""
fi

# Make up the HTTP Body
DATA="{${DOMAIN_DATA}${IP_DATA}${LINE_ID_DATA}}"

# API-HMAC = md5sum ( API_KEY + URL + DATA + API_REQEST_DATE + SECRET_KEY );
HMAC_STRING="${API_KEY}${URL}${DATA}${API_REQUEST_DATE}${SECRET_KEY}"
API_HMAC=$(echo -n ${HMAC_STRING} | md5sum | cut -b -32)

RESULT=$(curl -s -X POST \
-H "API-KEY:${API_KEY}" \
-H "API-REQUEST-DATE:${API_REQUEST_DATE}" \
-H "API-HMAC:${API_HMAC}" \
-H "API-FORMAT:${API_FORMAT}" \
-d ${DATA} ${URL} )

# Exit Code will be '0'' or '255'
if [ "${RESULT}" = '{"code":1,"message":"success"}' ];then
    echo "$(date -R)" -- Success && exit 0
else
    echo "$(date -R)" -- Failed:${RESULT} && exit -1
fi