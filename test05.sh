#!/bin/dash

echo "@@@@@ TEST: LEGIT-COMMIT (-a flag) @@@@@"
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
# legit-commit without .legit directory
echo "COMMAND: ../legit-commit"
../legit-commit
echo

echo "COMMAND: ../legit-init"
../legit-init
echo

# Check to ensure that files in index are updated before commit
# when the -a flag is called
echo "COMMAND: touch a"
touch a
echo

echo "COMMAND: echo some text > b"
echo some text > b
echo

echo "COMMAND: echo original c > c"
echo original c > c
echo

echo "COMMAND: echo sample lines > d"
echo sample lines > d
echo

echo "COMMAND: ../legit-add a b c d"
../legit-add a b c d
echo

echo "COMMAND: ../legit-commit -m 'First commit'"
../legit-commit -m 'First commit'
echo

echo "COMMAND: echo onelinehere > a"
echo onelinehere > a
echo

echo "COMMAND: echo more text >> b"
echo more text >> b
echo

echo "COMMAND: rm c"
rm c
echo

echo "COMMAND: ../legit-rm --cached d"
../legit-rm --cached d
echo

echo "COMMAND: echo a new file > e"
echo a new file > e
echo

echo "COMMAND: ../legit-commit -a -m 'Second commit'"
../legit-commit -a -m 'Second commit'
echo

echo "COMMAND: ../legit-show 1:a"
../legit-show 1:a
echo

echo "COMMAND: ../legit-show 1:b"
../legit-show 1:b
echo

echo "COMMAND: ../legit-show 1:c"
../legit-show 1:c
echo

echo "COMMAND: ../legit-show 1:d"
../legit-show 1:d
echo

echo "COMMAND: ../legit-show 1:e"
../legit-show 1:e
echo

cd ..
rm -r tests