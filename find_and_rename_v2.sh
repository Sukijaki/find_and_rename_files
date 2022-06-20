#!/bin/bash

STRING_TO_REPLACE=("_dev")
NEW_STRING=("_prod")


 find . -name *"$STRING_TO_REPLACE"* -type f -print0 | xargs -0 -I {} sh -c 'mv -v "{}" "$(dirname "{}")/`echo $(basename "{}") | sed 's/$STRING_TO_REPLACE/$NEW_STRING/g'`"'
