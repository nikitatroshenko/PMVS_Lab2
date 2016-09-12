#meteo.by

exec 2> /dev/null
rm index.html
TIMEOUT=$(grep "timeout=" ./config.ini | grep -o "[0-9]*")

wget http://meteo.by/minsk/retro/

while true
do
awk '/<p class="t ">/,/[+|-][0-9]/' ./index.html | grep -o "[0-9]*"
sleep $TIMEOUT
done
