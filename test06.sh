#!/bin/dash

echo "@@@@@ TEST: LEGIT-STATUS @@@@@"
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
# legit-status without .legit directory
echo "COMMAND: ../legit-status"
../legit-status
echo

echo "COMMAND: ../legit-init"
../legit-init
echo

# Each file represents one possible combination:
# a: content in working dir, index and commit are all different
# b: content in working dir same as index, different from commit
# c: content in working dir not the same as index and commit,
#    content in index and commit are the same
# d: file absent in working directory, present in index
# e: file absent in working directory and index
# f: content in working dir, index and commit all same
# g: content in working dir and index same,
#    file not present in commit
# h: file present in working directory, absent in index and commit
# i: file present in index, absent in working directory and commit
# j: file present in working directory and commit, absent in index
echo "COMMAND: touch a b c d e f g h i j"
touch a b c d e f g h i j
echo

echo "COMMAND: ../legit-add a b c d e f j"
../legit-add a b c d e f j
echo

echo "COMMAND: ../legit-commit -m 'first commit'"
../legit-commit -m 'first commit'
echo

echo "COMMAND: echo hello > a"
echo "COMMAND: echo hello > b"
echo "COMMAND: echo hello > c"
echo hello > a
echo hello > b
echo hello > c
echo

echo "COMMAND: ../legit-add a b"
../legit-add a b
echo

echo "COMMAND: echo world > a"
echo world > a
echo

echo "COMMAND: rm d"
rm d
echo

echo "COMMAND: ../legit-rm e"
../legit-rm e
echo

echo "COMMAND: ../legit-add g i"
../legit-add g i
echo

echo "COMMAND: rm i"
rm i
echo

echo "COMMAND: ../legit-rm --cached j"
../legit-rm --cached j
echo

echo "COMMAND: ../legit-status"
../legit-status
echo

cd ..
rm -r tests