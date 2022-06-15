#!/bin/dash

echo "@@@@@ TEST: LEGIT-RM (display warnings) @@@@@"
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

# Test: rm display warnings

echo "COMMAND: echo a > a"
echo a > a
echo

echo "COMMAND: echo b > b"
echo b > b
echo

echo "COMMAND: echo c > c"
echo c > c
echo

echo "COMMAND: ../legit-add a b c"
../legit-add a b c
echo

echo "COMMAND: ../legit-commit -m 'first'"
../legit-commit -m 'first'
echo

echo "COMMAND: echo aa >> a"
echo aa >> a
echo

echo "COMMAND: echo bb >> b"
echo bb >> b
echo

echo "COMMAND: echo cc >> c"
echo cc >> c
echo

echo "COMMAND: echo d > d"
echo d > d
echo

echo "COMMAND: echo e > e"
echo e > e
echo

echo "COMMAND: ../legit-add b c d"
../legit-add b c d
echo

echo "COMMAND: echo bbb > b"
echo bbb > b
echo

echo "COMMAND: ../legit-status"
../legit-status
echo

echo "COMMAND: ../legit-rm a"
../legit-rm a
echo

echo "COMMAND: ../legit-rm b"
../legit-rm b
echo

echo "COMMAND: ../legit-rm c"
../legit-rm c
echo

echo "COMMAND: ../legit-rm d"
../legit-rm d
echo

echo "COMMAND: ../legit-rm e"
../legit-rm e
echo

echo "COMMAND: ../legit-status"
../legit-status
echo

echo "COMMAND: ../legit-rm --cached a"
../legit-rm --cached a
echo

echo "COMMAND: ../legit-rm --cached b"
../legit-rm --cached b
echo

echo "COMMAND: ../legit-rm --cached c"
../legit-rm --cached c
echo

echo "COMMAND: ../legit-rm --cached d"
../legit-rm --cached d
echo

echo "COMMAND: ../legit-rm --cached e"
../legit-rm --cached e
echo

echo "COMMAND: ../legit-status"
../legit-status
echo

echo "COMMAND: ../legit-rm --force a"
../legit-rm --force a
echo

echo "COMMAND: ../legit-rm --force b"
../legit-rm --force b
echo

echo "COMMAND: ../legit-rm --force c"
../legit-rm --force c
echo

echo "COMMAND: ../legit-rm --force d"
../legit-rm --force d
echo

echo "COMMAND: ../legit-rm --force e"
../legit-rm --force e
echo

echo "COMMAND: ../legit-status"
../legit-status
echo

cd ..
rm -r tests