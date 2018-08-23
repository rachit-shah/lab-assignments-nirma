file=$1
lines=$( cat $file | wc -l )

while [ $lines -gt 0 ]
do
head -n $lines $file | tail -n 1 | rev
lines=` expr $lines - 1 `
done
