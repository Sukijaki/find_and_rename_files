#!/bin/bash

declare -a STRINGS_TO_REPLACE
STRING_TO_REPLACE=("_dev")
NEW_STRING=("_prod")

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
                    newfilename=$(echo "$justfilenamenopath" | sed "s/$current_string/$NEW_STRING/g")
                    mv -v "$n" "$justpathnofile/$newfilename"
                break;
            fi
        done
    done < <(find . \( -type f -name "[!.]*" \) -print0)
}

rename_files_remove_old_tags
