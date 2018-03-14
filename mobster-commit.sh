#!/usr/bin/env bash
MOBSTERS=`cat ~/Library/Application\ Support/mobster/active-mobsters`
# NOTE: authors must have an email to be valid, so they need to be in the form "Some name, another name, ... <email@address.com>"

mobstersArr=(${MOBSTERS//, / })
LEFT="<"
RIGHT=">"
EMAIL='@intuit.com'
SPACE=" "
NEWLINE="\r\n"
COAUTHOREDBY='Co-authored-by: '

COMMIT_STR=""

for i in "${mobstersArr[@]}"
do
	COMMIT_STR="${COMMIT_STR}${COAUTHOREDBY}${i}${SPACE}${LEFT}${i}${EMAIL}${RIGHT}
"
done

echo $COMMIT_STR

lastMessage=$(git log -1 --pretty=%B)
echo $lastMessage

export COMMIT_STR=$COMMIT_STR

COMMIT_STR="${lastMessage}

${COMMIT_STR}"

git commit --amend -m "$COMMIT_STR"
