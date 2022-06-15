#!/bin/dash

echo "@@@@@ TEST: LEGIT-INIT @@@@@"
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
echo "COMMAND: ls -d .legit"
ls -d .legit
echo

# Usage
echo "COMMAND: ../legit-init a"
../legit-init a
echo

# Execute when .legit is absent
echo "COMMAND: ../legit-init"
../legit-init
echo

echo "COMMAND: ls -d .legit"
ls -d .legit
echo

# Execute when .legit is present
echo "COMMAND: ../legit-init a"
../legit-init a
echo

echo "COMMAND: ../legit-init"
../legit-init
echo

cd ..
rm -r tests