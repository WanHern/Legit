#!/bin/dash

echo "@@@@@ TEST: LEGIT-COMMIT @@@@@"
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

# Usage
echo "COMMAND: ../legit-commit"
../legit-commit
echo

echo "COMMAND: ../legit-commit -a"
../legit-commit -a
echo

echo "COMMAND: ../legit-commit -m"
../legit-commit -m
echo

echo "COMMAND: ../legit-commit -m -a 'First commit!'"
../legit-commit -m -a 'First commit!'
echo

echo "COMMAND: ../legit-commit -a -m"
../legit-commit -a -m
echo

echo "COMMAND: ../legit-commit -a 'First commit!'"
../legit-commit -a 'First commit!'
echo

echo "COMMAND: ../legit-commit 'First commit!'"
../legit-commit 'First commit!'
echo

echo "COMMAND: ../legit-commit 'First commit!' -m"
../legit-commit 'First commit!' -m
echo

# Nothing to commit (index same as latest commit)
echo "COMMAND: ../legit-commit -m 'First commit!'"
../legit-commit -m 'First commit!'
echo

echo "COMMAND: ../legit-commit -m 'Second commit!'"
../legit-commit -m 'Second commit!'
echo

# Commit an addition/update/removal of a file
echo "COMMAND: touch a b c"
touch a b c
echo

echo "COMMAND: ../legit-add a b"
../legit-add a b
echo

echo "COMMAND: ../legit-commit -m 'Second commit!'"
../legit-commit -m 'Second commit!'
echo

echo "COMMAND: ../legit-add c"
../legit-add c
echo

echo "COMMAND: ../legit-commit -m 'Third commit!'"
../legit-commit -m 'Third commit!'
echo

echo "COMMAND: echo changed > a"
echo changed > a
echo

echo "COMMAND: ../legit-add a"
../legit-add a
echo

echo "COMMAND: ../legit-commit -m 'Fourth commit!'"
../legit-commit -m 'Fourth commit!'
echo

echo "COMMAND: ../legit-commit -m 'Fifth commit!'"
../legit-commit -m 'Fifth commit!'
echo

echo "COMMAND: rm a"
rm a
echo

echo "COMMAND: ../legit-add a"
../legit-add a
echo

echo "COMMAND: ../legit-commit -m 'Fifth commit!'"
../legit-commit -m 'Fifth commit!'
echo

echo "COMMAND: rm b"
rm b
echo

echo "COMMAND: ../legit-add b"
../legit-add b
echo

echo "COMMAND: touch b"
touch b
echo

echo "COMMAND: ../legit-add b"
../legit-add b
echo

echo "COMMAND: ../legit-commit -m 'Sixth commit!'"
../legit-commit -m 'Sixth commit!'
echo

cd ..
rm -r tests