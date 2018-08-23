echo "Database Management System"
echo "What do you want to do?"
echo "1.Insert data"
echo "2.Delete Data"
echo "3.Update data"
echo "4.Search"
read ch
case $ch in 
1) echo "Enter name"
   read name
   echo "Enter RollNo"
   read rno
   echo "Enter Marks"
   read marks
   echo "$name	$rno	$marks" >> db.txt;;
2) echo "Enter name or rollno to delete"
   read data
   grep -w -v $data db.txt >> new.txt
   mv -f new.txt db.txt;;
3) echo "Which entry do you want to change?(Enter a name or rollno)"
   read data
   echo "What do you want to change? 1.Name 2.RollNo 3.Marks"
   read cho
   if((cho==1))
   then
   	
4) echo "Enter data(name,rollno or marks to search)"
   read data
   grep -w -i $data db.txt;;
esac
   
