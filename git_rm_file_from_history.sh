#!/bin/sh

export FILTER_BRANCH_SQUELCH_WARNING=1
if [ "$1" != ""];then
git filter-branch --index-filter "git rm --cached --ignore-unmatch $1" --tag-name-filter 'cat' -- --all
fi
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git reflog expire --expire=now --all
git gc --aggressive --prune=now

echo "Next: git push origin --all --force"
