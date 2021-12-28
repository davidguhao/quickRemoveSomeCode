#!/bin/sh

START_NODE='// startNode-skklfiownvkldklwo'
START_NODE_sed=`./commentTranslator "$START_NODE"`

END_NODE='// endNode-skflwvnownfkvnwowkd'
END_NODE_sed=`./commentTranslator "$END_NODE"`

#COMMENT_TAG_STARTING='\/*'
#COMMENT_TAG_END='*\/'
echo Defined START_NODE=$START_NODE
echo Defined END_NODE=$END_NODE

echo Support Java/C only...
#echo Defined COMMENT_TAG_STARTING=$COMMENT_TAG_STARTING
#echo Defined COMMENT_TAG_END=$COMMENT_TAG_END

echo "\n\n"
if [ $# -ne 1 ]
then
	#echo $#
	echo "Usage: $0 path|file"
	echo "Instruction: You will need to add the two tag into your source"
	echo "file, then you will be able to remove the selected source"
	exit 1
fi

input=$1
if [ -e $input -a -f $input ]; then
	echo This is a file - $input
	sed -i "s/$START_NODE_sed/$START_NODE_sed\n\/\*/g" $input
	sed -i "s/$END_NODE_sed/\*\/\n$END_NODE_sed/g" $input
	echo Done
fi

if [ -e $input -a -d $input ]; then
	echo This is a directory - $input

	echo Replacing the starting node
	files=`grep "$START_NODE" $input -rl`
	sed -i "s/$START_NODE_sed/$START_NODE_sed\n\/\*/g" $files

	echo Replacing the ending node
	files=`grep "$END_NODE" $input -rl`
	sed -i "s/$END_NODE_sed/\*\/\n$END_NODE_sed/g" $files
fi
