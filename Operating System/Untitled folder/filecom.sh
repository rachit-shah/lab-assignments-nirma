while((1))
do
echo "What do you want to do"
echo "1. Make a copy of a file"
echo "2. Delete a file"
echo "3. Rename a file"
echo "4. Move a file"
echo "5. Concat two files"
echo "6. Count no. of lines"
echo "7. Create a directory"
echo "8. Make a copy of a directory"
echo "9. Delete a directory"
echo "10. Rename a directory"
echo "11. Move a directory"
echo "12. Count files in a directory"
echo "13. Exit"
read ch
case $ch in
1) while((1))
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
   	echo "Enter destination"
   	read dest
   	cp $name $dest
   	break
   else
   	echo "File does not exist.Try again"
   fi
   done;;
2) while((1))
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
   	rm $name
   	break
   else
   	echo "File does not exist.Try again"
   fi
   done;;
3) while((1))
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
	   echo "Enter new name"
	   read name2
	   mv $name $name2
	   break
   else
   	echo "File does not exist.Try again"
   fi
   done;;
4) while((1))
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
	   while((1))
	   do
	   echo "Enter destination"
	   read dest
	   if [ -f $dest ]
   	   then
	   	mv $name $dest
	   	break
	   else
	   	"Destination doesn't exist. Try again"
	   fi
	   done
	   break
   else
   	echo "File does not exist.Try again"
   fi
   done;;
5) while((1))
   do
   echo "Enter name of first file"
   read name
   if [ -f $name ]
   then
   	while((1))
   	do
   	echo "Enter name of second file"
   	read name2
   	if [ -f $name2 ]
   	then
   	    cat $name >> $name2
   	    break
   	else
   	    echo "File does not exist.Try again"
   	fi
   	done
   	break
   else
   	echo "File does not exist.Try again"
   fi
   done;;
6) while((1))
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
   	wc -l < $name
   	break
   else
   	echo "File does not exist.Try again"
   fi
   done;;
7) echo "Specify the name of the directory"
   read name
   mkdir $name;;
8) while((1))
   do
   echo "Specify the name of the directory"
   read name
   if [ -d $name ]
   then
   	echo "Enter destination directory or the name of the new directory you want to create"
   	read dest
   	cp -r $name $dest
   	break
   else
   	echo "Directory does not exist.Try again"
   fi
   done;;
9) while((1))
   do
   echo "Specify the name of the directory"
   read name
   if [ -d $name ]
   then
   	rmdir $name
   	break
   else
   	echo "Directory does not exist.Try again"
   fi
   done;;
10) while((1))
   do
   echo "Specify the name of the directory"
   read name
   if [ -d $name ]
   then
	   echo "Enter new name"
	   read dest
	   mv $name $dest
	   break
   else
   	echo "Directory does not exist.Try again"
   fi
   done;;
11) while((1))
   do
   echo "Specify the name of the directory"
   read name
   if [ -d $name ]
   then
   	echo "Enter destination directory"
   	read dest
   	cp -r $name $dest
   	rmdir $name
   	break
   else
   	echo "Directory does not exist.Try again"
   fi
   done;;
12) while((1))
   do
   echo "Specify the name of the directory"
   read name
   if [ -d $name ]
   then
	   cd $name
	   ls | wc -l
	   cd ..
	   break
   else
   	echo "Directory does not exist.Try again"
   fi
   done;;

13) exit;;
*) echo "Wrong choice";;
esac
done

