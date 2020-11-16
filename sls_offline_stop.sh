echo 'stop -> serverless offline'
sudo kill `cat .offline.pid`
sudo rm .offline.pid
echo 'serverless offline stopped'

