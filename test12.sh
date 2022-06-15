#!/bin/dash

echo "@@@@@ TEST: ALL @@@@@"
echo

# Run all tests one by one
files=$(ls | egrep "test.[0-9]+\.sh")
if [ -z "$files" ]
then
    echo "Other tests not found in current directory. Exiting..."
    exit 1
fi

for file in $files
do
    if ! echo $file | egrep "test12.sh"
    then
        echo "Running $file"
        ./$file
        read -p "Press enter to continue" tmp
    fi
done

echo "Tests run successfully"