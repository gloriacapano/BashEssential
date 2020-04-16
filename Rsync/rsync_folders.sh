#!/bin/bash

# If folder exists, delete
for FOLDER in master dev
do
if [ -d "$FOLDER" ]; then
    rm -rf $FOLDER
    echo "Removed $FOLDER"
fi
done


echo "Create folders master and dev"
mkdir master
mkdir dev

echo "Fill master and dev folders with files"
touch master/file{1..5}.txt
touch dev/file{6..10}.txt

echo "Visualize content of master"
ls master
echo "Visualize content of dev"
ls dev

# Sync master with dev
echo "Sync master with dev"
rsync -avz master/ dev
wait
echo "Visualize content of master"
ls master
echo "Visualize content of dev"
ls dev


# Sync dev with master
echo "Sync dev with master"
rsync -avz dev/ master
wait
echo "Visualize content of master"
ls master
echo "Visualize content of dev"
ls dev


# Create a folder within dev
echo "Create and fill dev/iss001 folder"
mkdir dev/iss001
touch dev/iss001/test{0..3}.txt


# Sync dev with master
echo "Sync dev with master"
rsync -avz dev/ master
wait
echo "Visualize content of master"
ls master
echo "Visualize content of dev"
ls dev