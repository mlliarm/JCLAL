#!/bin/bash

# bash for loop
for f in $( ls thesis-experiments/arffs/twentyUCI/ | sed 's/.arff//' ); do
	echo "starting experiment for $f"
	java -jar /jclal-1.1.jar -d thesis-experiments/cfgs/final/$f.cfgs
	#echo $f.cfgs
	echo "cleaning reports"
	cd reports/
	mkdir reports-$f
	mv *.txt reports-$f
	zip -r reports-$f.zip reports-$f/
	cd ..
	echo "finished cleaning"
	echo "sleeping 10s"
	sleep 10s
done 
