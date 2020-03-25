#!bin/bash

for i in {0..9}
do
	for j in {0..9}
	do
		for k in {0..9}
		do
			for n in {0..9}
			do
				echo $(cat $lockedfile) $i$j$k$n >> combos.txt
			done
		done
	done
done

