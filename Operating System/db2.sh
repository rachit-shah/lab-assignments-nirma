while [ 1 ]
do
echo "Database Management System"
echo "What do you want to do?"
echo "1.Insert data"
echo "2.Delete Data"
echo "3.Update data"
echo "4.Search"
echo "5.View all data"
echo "6.Exit"
read ch
case $ch in 
1) echo "Enter name"
   read name
   echo "Enter RollNo"
   read rno
   ch=`grep -w -i $rno db.txt`
   if [ -z "$ch" ]
   then
   	echo "Enter Marks"
   	read marks
   	echo "$name	$rno	$marks" >> db.txt
   	echo "Data inserted"
   else
   	echo "Rollno already exists"
   fi;;
2) echo "Enter name or rollno to delete"
   read dat
   grep -w -v -i $dat db.txt > new.txt
   mv -f new.txt db.txt
   echo "Record deleted";;
3) echo "Whose marks do you want to change?(Enter a name or rollno)"
   read dat
   store=`grep -w -i $dat db.txt | cut -d "	" -f 1-2`
   if [ -z "$store" ]
   then
   	echo "Name or rollno doesn't exist"
   else
   	echo "Enter new marks for $dat"
   	read marks
   	grep -w -v -i $dat db.txt > new.txt
   	echo "$store	$marks" | cat >> new.txt
   	mv -f new.txt db.txt
   	echo "Record updated"
   fi
   ;;
   	
4) echo "Enter data(name,rollno or marks to search)"
   read dat
   ch=`grep -w -i $dat db.txt`
   if [ -z "$ch" ]
   then
   	echo "No such record"
   else
   	echo $ch
   fi;;
5) cat db.txt;;
6) exit;;
*) echo "Wrong choice. Try again.";;
esac
done
   
