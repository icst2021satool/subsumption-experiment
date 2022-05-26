#!/usr/bin/env bash
set -x
readonly NOCOLOR="\033[0m"
readonly GREEN="\033[0;32m"
readonly RED="\033[0;31m"
readonly YELLOW="\033[1;33m"

readonly PROJECT_NAME=$1
readonly VERSION=$2

function install_project() {
	local project_dir=$1
	local d4j_projects="../jaguar-data"
	local project_path="$d4j_projects/$project_dir"
	local root=$(pwd)

	cd $d4j_projects

	# jaguar data project version
	echo -e "${YELLOW}[${PROJECT_NAME} ${VERSION}] jaguar data${NOCOLOR}"
	if test -f ${project_path}.tar.gz
	then
	    gunzip ${project_path}.tar.gz
	    tar xvf ${project_path}.tar
	    gzip ${project_path}.tar
	else
	    echo "${project_path}.tar.gz does not exist. Impossible to expand."
	fi

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

	local project_dir=$(cat projects.d4j | grep $PROJECT_NAME | awk '{print $2}' | xargs)

	if [ -z "$project_dir" ]
	then
		echo "Wrong project identifier. Possible values are:"
		cat projects.d4j
		echo
		exit 1
	fi

	install_project $project_dir
}

main

