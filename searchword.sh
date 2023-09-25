#!/usr/bin/env bash

if [ $# -lt 4 ]; then
        echo -e "Usage: searchword.sh <search_string> <# of words before> <# of words after>\n"
        exit
fi

pattern=$1
before=$2
after=$3
file=$4

len=$(($before + $after +1))

awk -v word=$pattern -v bef=$before -v aft=$after '{
        for (col=1;col<=NF;col++)
                if ($col == word)
				if(col-bef>=1 && col+aft <=NF)
                for (ind=col-bef;ind<=col+aft;ind++)
                print $ind 
		else printf "%s %s\n", "Illegal prameters for line",NR
}' $file|xargs -n $len
echo
