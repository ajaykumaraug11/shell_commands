#!/bin/bash

file=dev.properties

declare -A propsArray

while IFS='=' read -r k v; do
  [[ $k == *#* ]] && continue
  if [[ $v = *"SOMETHING"* ]]; then
        # assign different value to key if value is something...
        propsArray["$k"]="SOME_VALUE"
  else
        # assign the value to key otherwise....
        propsArray["$k"]="$v"
  fi
done < $file

echo applying properties from $file

# replace key-value pair for all files in folder
for folder in "/path/to/root/folder/"/*
do
  echo $folder
  for k in ${!propsArray[@]}
  	do
  	#echo "the key $k has value ${propsArray[${k}]}"
  	sed -i 's|'{{$k}}'|'"${propsArray[${k}]}"'|g' $folder/*.file;
  done
done



##############################################################################################
# sample properties file
# dev.properties
##############################################################################################
KEY1=VALUE1
#COMMENT ignored
KEY2-VALUE2
#EOF
##############################################################################################
##############################################################################################
# sample file
# dev.file
##############################################################################################
some content
replace here {{KEY1}}
replace here too {{KEY2}}
