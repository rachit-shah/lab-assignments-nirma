h=`date +%H`

if [ $h -lt 12 ]; then
  echo Good morning
elif [ $h -lt 18 ]; then
  echo Good afternoon
elif [ $h -lt 21];then
  echo Good evening
else
  echo good night
fi
