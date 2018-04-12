#!/bin/sh
clear
res=0
i="y"
echo "Enter first number: "
read n1
echo "Enter second number: "
read n2
while [ $i == "y" ]
do
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Modulus"
echo "Enter your choice (1-5) : "
read ch
case $ch in
1)res=`expr $n1 + $n2`
echo "Sum = "$res;;
2)res=`expr $n1 - $n2`
echo "Difference = "$res;;
3)res=`expr $n1 \* $n2`
echo "Product = "$res;;
4)if [ $n2 != '0' ]
then
res=`expr $n1 / $n2`
echo "Quotient = "$res
else
echo "Division by 0 not possible"
fi;;
5)if [ $n2 != '0' ]
then
res=`expr $n1 % $n2`
echo "Remainder = "$res
else
echo "Division by 0 not possible"
fi;;
*)echo "Invalid choice";;
esac
echo "Do you wish to continue? (y/n):  "
read i
if [ $i != "y" ]
then
   exit
fi
done

