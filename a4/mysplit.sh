#!/bin/bash

# set input and output file names
input_file=$1
train_output_file="./train/data.csv"
test_output_file="./test/data.csv"

# determine number of lines in input file (excluding header)
num_lines=$(wc -l < $input_file)
num_data_lines=$(($num_lines - 1))

# determine number of lines for train and test files
train_num_lines=$(echo "$num_data_lines * 0.8" | bc)
train_num_lines=$(printf "%.0f" $train_num_lines)
test_num_lines=$(($num_data_lines - $train_num_lines))

# replace delimiter with commas
if ! grep -q ',' "$1"; then
  sed -i 's/;/,/g' "$1" # replace semicolons with commas
fi


# copy header to output files
head -n 1 $input_file > $test_output_file

# replace separator with commas if necessary

head -n $train_num_lines $1 >> $train_output_file
tail -n $test_num_lines $1 >> $test_output_file

