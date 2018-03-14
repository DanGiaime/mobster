#!/usr/bin/env bash
MOBSTERS=`cat ~/Library/Application\ Support/mobster/active-mobsters`
# NOTE: authors must have an email to be valid, so they need to be in the form "Some name, another name, ... <email@address.com>"

mobstersArr=(${MOBSTERS//, / })
LEFT="<"
RIGHT=">"
EMAIL='@intuit.com'
SPACE=" "
NEWLINE="\n"
COAUTHOREDBY='Co-authored-by: '

COMMIT_STR=""

for i in "${mobstersArr[@]}"
do
	COMMIT_STR=$COMMIT_STR$i$SPACE$LEFT$i$EMAIL$RIGHT$NEWLINE
done

echo $COMMIT_STR

git commit -v --author="$$COMMIT_STR"
