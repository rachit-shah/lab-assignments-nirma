file=$1
line1=$2
count=1
while var= read -r line
do
	if [ $count -gt $line1 ]
	then
	break;
	else
	echo $line
	count=` expr $count + 1`
	fi
done < "$file"
