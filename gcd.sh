echo -n "Enter first number: "
read a
echo -n "Enter Second number: "
read b
if [ $a -lt $b ]; then 
	m=$a
else
	m=$b
fi
while [ $m -ne 0 ]; do
	x=$(expr $a % $m)
	y=$(expr $b % $m)
	if [ $x -eq 0 ] && [ $y -eq 0 ]; then
		echo $m
		exit 1
	fi
	m=$(expr $m - 1)
done
