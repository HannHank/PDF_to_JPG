#!/bin/bash
foo=$(pdfinfo $1 | grep Pages | awk '{print $2}')
echo "Pages:" $foo
foo=$(( foo-1 ))
# minus 1 because we start with 0
n=1
name=$2
dest=$3

# continue until $n equals 5
while [ $n -le $foo ]
do
    convert -density 300 -trim $1[$n] -quality 100 $dest/$name.jpg
	echo "Page $n converted."
	n=$(( n+1 ))
    name=$(( name+1 ))	 # increments $n
done

# How to use: ./convert.sh bla/bla/bla.pdf (name where to start ) 500 (destination where to save) /bla/bla