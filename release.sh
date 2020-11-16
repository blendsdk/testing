#!/bin/bash
LERNA=./node_modules/.bin/lerna
BRANCH_NAME=`git branch |grep \* | cut -d " " -f2`
DIST_TAG=beta
RELEASE_BRANCH="release-`date +%s`"
if [ "${BRANCH_NAME}" = "master" ]; then
    DIST_TAG=latest
fi;

git checkout -b ${RELEASE_BRANCH}
if [ "$DIST_TAG" === "beta"]; then
    $LERNA version --conventional-commits --conventional-prerelease --no-changelog --no-git-tag-version --no-push --preid ${DIST_TAG}
fi;
