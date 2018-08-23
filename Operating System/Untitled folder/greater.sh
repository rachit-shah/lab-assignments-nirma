
if [ $1 -gt $2 ] && [ $1 -gt $3 ]
	then echo "$1 is greater"
else if [ $2 -gt $1 ] && [ $2 -gt $3 ]
	then echo "$2 is greater"
else if [ $3 -gt $1 ] && [ $3 -gt $2 ]
	then echo "$3 is greater"
	
else ""	
fi
fi
fi	
