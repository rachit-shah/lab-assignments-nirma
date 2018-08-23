n=1
while [ $n -lt 10 ]
do 
	ans=` expr $n \* $1`
	echo "$1 * $n = $ans"
	n=`expr $n + 1`
done
