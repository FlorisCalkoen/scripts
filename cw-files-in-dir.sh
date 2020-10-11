#!/bin/bash
if [ -z "$1" ]; then
    echo "No directory supplied"
    exit 1
fi

sum=0
count=0
for i in $1*.pdf; do
  echo "Counting words..: $i"
	word_count=`pdftotext $i - | tr -d '.' | wc -w`
	count=$((count + 1))
	sum=$((sum + word_count))
	echo $word_count
done

average=$((sum / count))
echo "Average word count: $average"
