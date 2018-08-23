echo "FILE and DIRECTORY MANAGEMENT"
while [ 1 ]
do
echo "Your present working directory is"
pwd
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
echo "13. List all files in directory"
echo "14. view a file"
echo "15. Exit"
read ch
case $ch in
1) while [ 1 ]
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
   	while [ 1 ]
   	do
   	echo "Enter destination"
   	read dest
   	if [ -d $dest ]
   	then
   	echo "Overwrite existing file?1. for Yes/ 2. for No"
   	read cho
   		if [ $cho -eq 1 ]
   		then 
   		 cp $name $dest
		 echo "File Copied"
   		 break
   		fi
        else
	    cp $name $dest
	    echo "File Copied"
	    break
   	fi
   	done
   	break   	
   else
   	echo "File does not exist.Try again"
   fi
   done;;
2) while [ 1 ]
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
   	rm $name
	echo "File deleted"
   	break
   else
   	echo "File does not exist.Try again"
   fi
   done;;
3) while [ 1 ]
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
	   while [ 1 ]
	   do
	   echo "Enter new name"
	   read name2
	   if [ -f $name2 ]
	   	then
	   	echo "Overwrite existing file?1. for Yes/ 2. for No"
	   	read cho
	   		if [ $cho -eq 1 ]
	   		then 
	   		 mv $name $name2
			 echo "File renamed"
	   		 break
	   		else
	   		 echo "Give another name"
	   		fi
	   else
		mv $name $name2
		echo "File renamed"
		break
	   fi
	   done
	   break
   else
   	echo "File does not exist.Try again"
   fi
   done;;
4) while [ 1 ]
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
	   while [ 1 ]
	   do
	   echo "Enter destination"
	   read dest
	   if [ -d $dest ]
   	   then
	   	mv $name $dest
		echo "File moved"
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
5) while [ 1 ]
   do
   echo "Enter name of first file"
   read name
   if [ -f $name ]
   then
   	while [ 1 ]
   	do
   	echo "Enter name of second file"
   	read name2
   	if [ -f $name2 ]
   	then
   	    cat $name >> $name2
	    echo "File concatenated"
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
6) while [ 1 ]
   do
   echo "Specify the name of the file"
   read name
   if [ -f $name ]
   then
	echo "No. of lines:"   	
	wc -l < $name
   	break
   else
   	echo "File does not exist.Try again"
   fi
   done;;
7) echo "Specify the name of the directory"
   read name
   mkdir $name
   echo "Directory created";;
	
8) while [ 1 ]
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
9) while [ 1 ]
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
10) while [ 1 ]
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
11) while [ 1 ]
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
12) while [ 1 ]
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
13)ls;;
14)echo "Enter name of file"
	read name
 cat name;;
15) exit;;
*) echo "Wrong choice";;
esac
done

