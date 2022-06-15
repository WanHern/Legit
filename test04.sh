#!/bin/dash

echo "@@@@@ TEST: LEGIT-SHOW @@@@@"
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
echo "COMMAND: ../legit-show"
../legit-show
echo

echo "COMMAND: ../legit-init"
../legit-init
echo

# legit-show without commits
echo "COMMAND: ../legit-show"
../legit-show
echo

# Usage
echo "COMMAND: touch a"
touch a
echo

echo "COMMAND: echo hello, this is some text > b"
echo hello, this is some text > b
echo

echo "COMMAND: echo hello > c"
echo hello > c
echo

echo "COMMAND: ../legit-add a b c"
../legit-add a b c
echo

echo "COMMAND: ../legit-commit -m 'First commit'"
../legit-commit -m 'First commit'
echo

echo "COMMAND: ../legit-show"
../legit-show
echo

echo "COMMAND: ../legit-show a"
../legit-show a
echo

echo "COMMAND: ../legit-show :"
../legit-show :
echo

echo "COMMAND: ../legit-show 0:"
../legit-show 0:
echo

echo "COMMAND: ../legit-show 0:f"
../legit-show 0:f
echo

echo "COMMAND: ../legit-show 0:a:a"
../legit-show 0:a:a
echo

echo "COMMAND: ../legit-show 0:aa"
../legit-show 0:aa
echo

echo "COMMAND: ../legit-show a:0"
../legit-show a:0
echo

echo "COMMAND: ../legit-show 2:a"
../legit-show 2:a
echo

# legit-show with modifications and several commits
echo "echo world >> c"
echo world >> c
echo

echo "echo an extra line >> b"
echo an extra line >> b
echo

echo "echo an extra file > d"
echo an extra file > d
echo

echo "COMMAND: ../legit-add a b c d"
../legit-add a b c d
echo

echo "COMMAND: ../legit-commit -m 'Second commit'"
../legit-commit -m 'Second commit'
echo

echo "COMMAND: ../legit-rm b"
../legit-rm b
echo

echo "COMMAND: rm d"
rm d
echo

echo "COMMAND: ../legit-commit -m 'Third commit'"
../legit-commit -m 'Third commit'
echo

echo "COMMAND: ../legit-show :a"
../legit-show :a
echo

echo "COMMAND: ../legit-show :b"
../legit-show :b
echo

echo "COMMAND: ../legit-show :c"
../legit-show :c
echo

echo "COMMAND: ../legit-show :d"
../legit-show :d
echo

echo "COMMAND: ../legit-show 0:a"
../legit-show 0:a
echo

echo "COMMAND: ../legit-show 0:b"
../legit-show 0:b
echo

echo "COMMAND: ../legit-show 0:c"
../legit-show 0:c
echo

echo "COMMAND: ../legit-show 0:d"
../legit-show 0:d
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

echo "COMMAND: ../legit-show 2:a"
../legit-show 2:a
echo

echo "COMMAND: ../legit-show 2:b"
../legit-show 2:b
echo

echo "COMMAND: ../legit-show 2:c"
../legit-show 2:c
echo

echo "COMMAND: ../legit-show 2:d"
../legit-show 2:d
echo

cd ..
rm -r tests