TMPFILE=.offline$$.log
if [ -f .offline.pid ]; then
    echo "Found file .offline.pid. Not starting."
    exit 1
fi

echo 'start -> sls offline'

sudo serverless offline 2>1 > $TMPFILE &
PID=$!
echo $PID > .offline.pid

while ! grep "server ready" $TMPFILE
do
echo 'starting ...'
echo `cat 1`
sleep 1; done

echo 'sls offline started, removing tmp log file'

sudo rm $TMPFILE