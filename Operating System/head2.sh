f1=$1
lin=$2
f2=$3
while [ 1 ]
do
if [ -f $f1 ]
then
break
else
echo "Enter correct Filename"
fi 
done
if [ -f $f2 ]
then
	echo "Do you want to overwrite?1.Yes 2 .NO"
else 
	echo "Do you want to create new file?1.YES 2.NO"
fi
read ch
if [ $ch -eq 1 ]
then
if [ -f $f2 ]
then
rm $f2
fi
count=1
while var= read -r line
do
	if [ $count -gt $lin ]
	then
	break;
	else
	echo $line >> $f2
	count=` expr $count + 1`
	fi
done < "$f1"
fi

