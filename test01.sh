#!/bin/dash

echo "@@@@@ TEST: LEGIT-ADD @@@@@"
echo

# Make empty directory for tests
if [ -d "tests" ]
then
    echo "Directory 'tests' already exists. This test requires to create a new directory 'tests'"
    echo "Exiting..."
    exit 1
fi

echo "COMMAND: mkdir tests"
mkdir tests

echo "COMMAND: cd tests"
cd tests

echo "COMMAND: ls -a"
ls -a
echo

# Start tests
# legit-add without .legit directory
echo "COMMAND: ../legit-add"
../legit-add
echo

echo "COMMAND: ../legit-init"
../legit-init
echo

# Usage
echo "COMMAND: ../legit-add"
../legit-add
echo

# legit-add non-existing file
echo "COMMAND: ../legit-add a"
../legit-add a
echo

echo "COMMAND: ../legit-show :a"
../legit-show :a
echo

# legit-add existing file
echo "COMMAND: echo hello > a"
echo hello > a
echo

echo "COMMAND: ls -a"
ls -a
echo

echo "COMMAND: ../legit-add a"
../legit-add a
echo

echo "COMMAND: ../legit-show :a"
../legit-show :a
echo

# legit-add existing files and non-existing files
echo "COMMAND: ../legit-add a b c"
../legit-add a b c
echo

# legit-add edited file
echo "COMMAND: touch b c"
touch b c
echo

echo "COMMAND: echo world >> a"
echo world >> a
echo

echo "COMMAND: ls -a"
ls -a
echo

echo "COMMAND: ../legit-add a b c"
../legit-add a b c
echo

echo "COMMAND: ../legit-show :a"
../legit-show :a
echo

# legit-add hidden file
echo "COMMAND: touch .hidden.txt"
touch .hidden.txt
echo

echo "COMMAND: ls -a"
ls -a
echo

echo "COMMAND: ../legit-add .hidden.txt"
../legit-add .hidden.txt
echo

echo "COMMAND: ../legit-show :.hidden.txt"
../legit-show :.hidden.txt
echo

cd ..
rm -r tests