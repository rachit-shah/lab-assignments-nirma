echo "Enter the First Number"
read a
echo "Enter Second Number"
read b
echo "Fibonnaci Series is"
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
