#!/bin/bash
# for x64

desktop="true"
desktop1=true

if [ "$desktop" = true ]; then
    echo "The values are equal."
else
    echo "The values are not equal."
fi

parent_dir=$(dirname "$(pwd)")
ln -s "$parent_dir/zzu" ~/