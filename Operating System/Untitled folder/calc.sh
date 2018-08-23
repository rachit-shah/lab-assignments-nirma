echo "Enter operands"
read num1
read num2
echo "Select one of the operations"
echo "1.Addition"
echo "2.Subtraction"
echo "3.Multiplication"
echo "4.Divison"
echo "5.Floating Addition"

echo "6.Floating Subtraction"
echo "7.Floating Multiplication"
echo "8.Floating DIVISON"
read choice
case  $choice in
1) echo "$num1 + $num2=`expr $num1 + $num2`";;
2) echo "$num1 - $num2=`expr $num1 - $num2`";;
3) echo "$num1 * $num2=`expr $num1 \* $num2`";;
4) echo "$num1 / $num2=`expr $num1 / $num2`";;
5) echo "$num1 + $num2" | bc -l;;
6) echo "$num1 - $num2" | bc -l;;
7) echo "$num1 * $num2" | bc -l;;
8) echo "$num1 / $num2" | bc -l;;

*) echo "Wrong choice";;
esac
