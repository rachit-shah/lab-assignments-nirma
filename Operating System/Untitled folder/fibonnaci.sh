echo " enter the first number"
read a
echo "enter second number"
read b
echo "fibonnaci series is"
echo $a
echo $b
c=0
i=0
while [ $i -lt 10 ]
do
 c=` expr $a + $b `
 a=` expr $b `
 b=` expr $c `
 
 echo $c
 i=` expr $i + 1 ` 
done
