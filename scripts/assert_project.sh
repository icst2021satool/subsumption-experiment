#!/usr/bin/env bash
set -x
readonly NOCOLOR="\033[0m"
readonly GREEN="\033[0;32m"
readonly RED="\033[0;31m"
readonly YELLOW="\033[1;33m"

readonly PROJECT_NAME=$1
readonly VERSION=$2

function assert_project() {
	local project_dir=$1
	local cov_projects="../jaguar-programs-extended"
	local project_path="$cov_projects/$PROJECT_NAME/${VERSION}/jaguar"
	local root=$(pwd)


	# run assert_jaguar.py
	echo -e "${YELLOW}[${PROJECT_NAME} ${VERSION}] Jaguar DUA coverage ${NOCOLOR}"
	./assert_jaguar.py ${project_path}

	# back to root folder
	cd $root
}

function main() {
  pwd
	if [ -z "$PROJECT_NAME" ]
	then
	    echo "Missing project identifier. Possible values are:"
	    cat projects.d4j
	    echo
	    exit 1
	fi

	if [ -z "$VERSION" ]
	then
	    echo "Missing project version. Possible values are (append 'b' for buggy and 'f' for fixed):"
	    cat versions.d4j
	    echo
	    exit 1
	fi

	local project_dir=$(cat projects.d4j | grep $PROJECT_NAME | sed "s/$PROJECT_NAME//g" | xargs)

	if [ -z "$project_dir" ]
	then
		echo "Wrong project identifier. Possible values are:"
		cat projects.d4j
		echo
		exit 1
	fi

	assert_project $project_dir
}

main

