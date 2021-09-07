TEMPFILE=/tmp/$$.tmp

echo 0 > $TEMPFILE

if curl -s "myproject.conabio.gob.mx" | grep -q "I have no friends to greet"
then
    echo "Web service is on"
    COUNTER=$[$(cat $TEMPFILE) * 0]
else
    COUNTER=$[$(cat $TEMPFILE) + 1]
    if [[ "$COUNTER " -eq 40 ]]; then 
         cat notificationemail.txt | sendmail -i -t
    fi
fi

ECHO $COUNTER > $TEMPFILE
