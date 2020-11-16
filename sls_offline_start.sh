TMPFILE=.offline$$.log
if [ -f .offline.pid ]; then
    echo "Found file .offline.pid. Not starting."
    exit 1
fi

echo 'start -> sls offline'

serverless offline 2>1 > $TMPFILE &
PID=$!
echo $PID > .offline.pid

while ! grep "server ready" $TMPFILE
do
echo 'starting ...'
sleep 1; done

echo 'sls offline started, removing tmp log file'

rm $TMPFILE
rm 1