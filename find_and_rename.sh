#!/bin/bash

declare -a STRINGS_TO_REPLACE
STRINGS_TO_REPLACE=("_dev")


################################

rename_files_remove_old_tags() {
    while IFS= read -r -d '' n; do

        filepathnodot="${n#.}"
        # echo "$filepathnodot"

        justfilenamenopath="${n##*/}"
        # echo "$justfilenamenopath"

        justpathnofile=${n%/*}
        # echo "$justpathnofile"

        for current_string in "${STRINGS_TO_REPLACE[@]}" ;
        do
            if [[ "$justfilenamenopath" == *"$current_string"* ]]; 
            then
                # echo "Will rename $justfilenamenopath"
                test -e "$n" &&
                    newfilename=$(echo "$justfilenamenopath" | sed "s/$current_string/_prod/g")
                    mv -v "$n" "$justpathnofile/$newfilename"
                break;
            fi
        done
    done < <(find . \( -type f -name "[!.]*" \) -print0)
}

rename_files_remove_old_tags
