#!/bin/bash
REPO_STATE=`git diff-index --quiet HEAD`
BRANCH_NAME=`git branch |grep \* | cut -d " " -f2`
DIST_TAG=beta
RELEASE_BRANCH="release-`date +%s`"
if [ "${BRANCH_NAME}" = "master" ]; then
    DIST_TAG=latest
fi;

echo "$REPO_STATE"
#git checkout -b ${RELEASE_BRANCH}
