time=$(who -b | cut -c 34-35)
if (($time < 12)); then
	echo "Good Morning"
elif (($time < 18)); then
	echo "Good Afternoon"
else
	echo "Good Night"
fi
