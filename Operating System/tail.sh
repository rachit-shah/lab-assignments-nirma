file=$1
output=$2
y=$(cat $file | wc -l)
count=0

m=$3

count=0

count1=` expr $y - $m `

if [ $m -lt $y ]
then

    while IFS= read line
    do
                    count=` expr $count + 1`
                    if [ $count -gt $count1 ]
                    then
                            echo " $line " | cat >> $output
                    fi
                   
    done < "$file"

else
    echo "Invalid "
fi   
