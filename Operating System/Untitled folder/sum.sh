no=$1
i=1
sum1=0
while [ $i -le $no ]
do
sum1=`expr $sum1 + $i`
i=` expr $i + 1 `
done
echo $sum1
