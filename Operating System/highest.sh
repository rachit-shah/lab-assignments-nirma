echo "Enter number 1"
read no1
echo "Enter number 2"
read no2
echo "Enter number 3"
read no3
highest=0
if [ $no1 -gt $no2 ]
then
	if [ $no1 -gt $no3 ]
	then
		highest=$no1
	else
		highest=$no3
	fi
else
	if [ $no2 -gt $no3 ]
	then
		highest=$no2
	else
		highest=$no3
	fi
fi
echo $highest
