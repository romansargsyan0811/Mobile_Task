echo -n "Input the ranges first numbers: "  
read  first_num 
echo -n "Input the ranges last numbers: "
read  second_num 
echo "***************************************"
result=0
number=`seq $first_num $second_num `
for n in ${number[@]};do
	for((i=n-1; i>=2; i--))
	do
  		if [ $((n%i)) -eq 0 ];then
			result=1;	
			break
		else
			result=0
  		fi
	done
	if [ $result -eq 1 ]; then
		continue	
	else
		echo $n
	fi
done
