#!/bin/dash

echo "@@@@@ TEST: LEGIT-RM (no flags) @@@@@"
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
# legit-rm without .legit directory
echo "COMMAND: ../legit-status"
../legit-status
echo

echo "COMMAND: ../legit-init"
../legit-init
echo

# Usage
echo "COMMAND: ../legit-rm"
../legit-rm
echo

echo "COMMAND: ../legit-rm --force"
../legit-rm --force
echo

echo "COMMAND: ../legit-rm --cached"
../legit-rm --cached
echo

echo "COMMAND: ../legit-rm --cached --force a"
../legit-rm --cached --force a
echo

echo "COMMAND: ../legit-rm --force --cached a"
../legit-rm --force --cached a
echo

# Test: rm
echo "COMMAND: echo hello > a"
echo hello > a
echo

echo "COMMAND: echo world > b"
echo world > b
echo

echo "COMMAND: ../legit-add a b"
../legit-add a b
echo

echo "COMMAND: ../legit-commit -m 'first'"
../legit-commit -m 'first'
echo

echo "COMMAND: ../legit-rm --cached a b"
../legit-rm a b
echo

echo "COMMAND: ../legit-commit -m 'second'"
../legit-commit -m 'second'
echo

echo "COMMAND: ls"
ls
echo

echo "COMMAND: ../legit-show :a"
../legit-show :a
echo

echo "COMMAND: ../legit-show :b"
../legit-show :b
echo

echo "COMMAND: ../legit-show 0:a"
../legit-show 0:a
echo

echo "COMMAND: ../legit-show 0:b"
../legit-show 0:b
echo

echo "COMMAND: ../legit-show 1:a"
../legit-show 1:a
echo

echo "COMMAND: ../legit-show 1:b"
../legit-show 1:b
echo

cd ..
rm -r tests