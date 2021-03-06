#!/bin/bash

# Bash Script - Shardul Shah

rm -f re.idx
rm -f te.idx
rm -f ye.idx

sort -u -o terms.txt terms.txt
sort -u -o recs.txt recs.txt
sort -u -o years.txt years.txt

# can't output the same file name as in the input file name in perl commands like these, or the output file gets written blank (not sure why; but output file name must be different from input file name
perl break.pl <terms.txt >terms_o.txt 
perl break.pl <recs.txt >recs_o.txt
perl break.pl <years.txt >years_o.txt

db_load -T -t hash -f recs_o.txt -c duplicates=1 re.idx
db_load -T -t btree -f terms_o.txt -c duplicates=1 te.idx
db_load -T -t btree -f years_o.txt -c duplicates=1 ye.idx

# Use the following command to test/show the database as terminal output. Replace index_name.idx with the index name:
db_dump -p ye.idx


