echo '<TESTING FILE>'
echo Initializing
cp test.bk testFolder/test
echo start
./quickRemoveSomeCode.sh testFolder/test

echo '<TESTING FOLDER>'
echo Initializing
cp test.bk testFolder/test
cp commentTranslator.c testFolder/
echo start
./quickRemoveSomeCode.sh testFolder
