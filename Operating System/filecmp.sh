f1=$1
f2=$2
l1=$( cat $f1 | wc -l )
echo $l1
l2=$( cat $f2 | wc -l )
echo $l2
cnt1=1
cnt2=1
flag=1
while [ $cnt1 -lt $l1 -a $cnt2 -lt $l2 ]
do
	str1= head -n $cnt1 $f1 | tail -n 1
	echo $str1
	cnt1=` expr $cnt1 + 1 `
        str2= head -n $cnt2 $f2 | tail -n 1
	echo $str2
	cnt2=` expr $cnt2 + 1 `
        len1=$( wc -c $str1 )
	echo $len1
	len2=$( wc -c $str2 )
	echo $len2
	if [ $len1 -ge $len2 ]
	then
	length=$len1
	else
	length=$len2
	fi
	i=1
	while [ $i -lt $length ]
	do
		c1=$( cut -c $i $str1 )
		c2=$( cut -c $i $str2 )
		if [ $c1 -ne $c2 ]
		then
		flag=0
		fi
		i=` expr $i + 1 `
        done
done

if [ $flag -eq 1 ] 
then
	echo "FILE SAME"
else
	echo "FILE DIFFERENT"
fi
