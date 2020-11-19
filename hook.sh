#!/usr/bin/env bash

if [ "$PAM_TYPE" != "close_session" ]; then

    #Setting
#    API='' #Your Mailgun API
#    DOMAIN='' #Domain provided by Mailgun
#    TO='' #The email you want to send the alerts

    #Don't touch! Grrr.
    FROM="wanghongke1985@126.com"
    DATE=$(date) #This line of code is not neccessary.
    SERVER=`uname -a`
    SNAME=`uname -sn` #This line is also not neccessary. I want to look cool, ok?

    SUBJECT="Login: $PAM_USER @ $SNAME from $PAM_RHOST" #Title of the email in regards to the person that has logged into the server successfully

    #Email text format - All the information you want to know
    BODY="
    SSH login was successful, here is the following information:
      	User:           $PAM_USER
    	  User IP:        $PAM_RHOST
    	  Service:        $PAM_SERVICE
    	  Date:           $DATE
    	  Server:         $SERVER
    "

    #This will use the cURL method to interact with Mailgun's API, and it will gather the information from above.
    curl --verbose -s --url "smtp://smtp.126.com:25" --mail-from 'wanghongke1985@126.com' \
    --mail-rcpt '859615030@qq.com'  --user "wanghongke1985:BHHUPGJZQTMQYPCF" -T  <(echo -e "From: wanghongke1985@126.com\nTo: 859615030@qq.com\nSubject: ${SUBJECT}\nText: ${BODY}")
fi
