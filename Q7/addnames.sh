if [ "$#" != 2 ]
then
	echo "Insufficient parameters"
else
	if [ -e $1 ]
	then
	    echo "File exists !"
		if grep -q $2 $1
		then
			echo "User already exists !"
		else
			$(echo $2 >> $1)
			echo "Saved user !"
		fi
	else
	    echo "File does not exist !"
	fi
fi
