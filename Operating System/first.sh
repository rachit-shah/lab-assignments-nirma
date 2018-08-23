echo " enter the number"
read no
i=1
while [ $i -le 10 ]
do
echo "$no * $i =`expr $no \* $i` "
i=` expr $i + 1 `
done
