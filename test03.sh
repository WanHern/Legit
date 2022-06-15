#!/bin/dash

echo "@@@@@ TEST: LEGIT-LOG @@@@@"
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
# legit-log without .legit directory
echo "COMMAND: ../legit-log"
../legit-log
echo

echo "COMMAND: ../legit-init"
../legit-init
echo

# Usage
echo "COMMAND: ../legit-log a"
../legit-log a
echo

# legit-log with no commits
echo "COMMAND: ../legit-log"
../legit-log
echo

# legit-log with commits
echo "COMMAND: touch a"
touch a
echo

echo "COMMAND: ../legit-add a"
../legit-add a
echo

echo "COMMAND: ../legit-commit -m 'First commit!'"
../legit-commit -m 'First commit!'
echo

echo "COMMAND: ../legit-log"
../legit-log
echo

echo "COMMAND: ../legit-commit -m 'Second commit!'"
../legit-commit -m 'Second commit!'
echo

echo "COMMAND: ../legit-log"
../legit-log
echo

echo "COMMAND: touch b"
touch b
echo

echo "COMMAND: rm a"
rm a
echo

echo "COMMAND: ../legit-add a b"
../legit-add a b
echo

echo "COMMAND: ../legit-commit -m 'Second commit!'"
../legit-commit -m 'Second commit!'
echo

echo "COMMAND: ../legit-log"
../legit-log
echo

echo "COMMAND: touch a b c d e f"
touch a b c d e f
echo

echo "COMMAND: ../legit-add a b c d e f"
../legit-add a b c d e f
echo

echo "COMMAND: ../legit-commit -m '@@!! ~Third---- commit to BE SUREE! ##and extra symbols./'"
../legit-commit -m '@@!! ~Third---- commit to BE SUREE! ##and extra symbols./'
echo

echo "COMMAND: ../legit-log"
../legit-log
echo

cd ..
rm -r tests