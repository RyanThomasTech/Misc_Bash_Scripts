#!/bin/bash

echo "input \"add\",\"sub\",\"mult\",\"div\",\"exp\", or \"exit\"."
while read line; do
	case "$line" in
	
		add) 	echo "A+B: input A"
			read num1
			echo "A+B: input B"
			read num2
			total=$(($num1 + $num2))
			echo "result: $total"
			
echo "input \"add\",\"sub\",\"mult\",\"div\",\"exp\", or \"exit\"."
			;;
		sub)	echo "A-B: input A"
			read num1
			echo "A-B: input B"
			read num2
			total=$(($num1-$num2))
			echo "total: $total"
echo "input \"add\",\"sub\",\"mult\",\"div\",\"exp\", or \"exit\"."
			;;
		mult)	echo "A*B: input A"
			read num1
			echo "A*B: input B"
			read num2
			total=$(($num1*$num2))
			echo "result: $total"
echo "input \"add\",\"sub\",\"mult\",\"div\",\"exp\", or \"exit\"."
			;;
		div)	echo "A/B: input A"
			read num1
			echo "A/B: input B"
			read num2
			total=$(($num1/$num2))
			echo "result: $total"
echo "input \"add\",\"sub\",\"mult\",\"div\",\"exp\", or \"exit\"."
			;;
		exp)	echo "A^B: input A"
			read num1
			echo "A^B: input B"
			read num2
			total=$(($num1**$num2))
			echo "result: $total"
echo "input \"add\",\"sub\",\"mult\",\"div\",\"exp\", or \"exit\"."
			;;
		exit)	exit 0
			;;
		*)	echo "Usage: input \"add\",\"sub\",\"mult\",\"div\",\"exp\", or \"exit\"."
			;;
	esac
done
		
