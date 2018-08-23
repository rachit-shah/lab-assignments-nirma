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
   read dat
   grep -w -v $dat db.txt > new.txt
   mv -f new.txt db.txt;;
3) echo "Whose marks do you want to change?(Enter a name or rollno)"
   read dat
   ln= grep -w -n $dat db.txt | cut -d ":" -f 1
   echo $ln
   head -n$ln db.txt | cat > new.txt;;
   	
4) echo "Enter data(name,rollno or marks to search)"
   read dat
   grep -w -i $dat db.txt;;
esac
   
