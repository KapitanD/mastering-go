#!/usr/bin/env bash

MASTERING_GO_FOLDER_NAME="mastering-go"

print_usage() {
cat <<EOF
usage: create_exercise.sh [-h] [-c chapter] [-e exercise]
EOF
}

print_help() {
cat <<EOF

DESCRIPTION:
Create template folder for exercise from book "Mastering Go. Second edition" by Mihalis Tsoukalos.
Folder contains main.go, Makefile for build and run, README.md for exercise description

OPTIONS:
	-c chapter
		Chapter number for template folder generation
	-e exercise
		Exercise number for template folder generation

EXAMPLE:
	$./create_exercise.sh -c 1 -e 1
	$tree chapter-1
	chapter-1
	└── exercise-1
	    ├── Makefile
	    ├── README.md
	    ├── bin
	    └── main.go

	2 directories, 3 files
EOF
}

if [[ $# -eq 0 ]]; then
	print_usage
	exit 1
fi

chapter=''
exercise=''
help=''

while getopts 'c:e:h' flag; do
	case "${flag}" in
	c) chapter="${OPTARG}" ;;
	e) exercise="${OPTARG}" ;;
	h) help='true' ;;
	*) print_usage
		exit 1;;
	esac
done

if [[ -n $help ]]; then
	print_usage
	print_help
	exit 0
fi

if [[ -z $chapter || -z $exercise ]]; then
	print_usage
	exit 1
fi

if [[ ${PWD##*/} != $MASTERING_GO_FOLDER_NAME ]]; then 
	echo "Error: folder for exec this script must be '${MASTERING_GO_FOLDER_NAME}', current '${PWD##*/}'" >&2
	exit 1
fi

folder="chapter-${chapter}/exercise-$exercise"

if [[ -d ${PWD}/$folder ]]; then
	echo "Error: folder for chapter ${chapter} exercise ${exercise} already exist" >&2
	exit 1
fi

mkdir -p ${folder}
# Create go code source template
cat > ${folder}/main.go <<EOF
package main

func main() {
	return
}
EOF

mkdir ${folder}/bin
# Create Makefile template
cat > ${folder}/Makefile <<"EOF"
GOOS?=darwin
GOARCH?=amd64

.PHONY: build
build: 
	CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} go build -o bin/main main.go

.PHONY: run
run: build
	bin/main

EOF
# Create readme file template
cat > ${folder}/README.md <<EOF
# Chapter ${chapter}, exercise ${exercise}
## Description
Your description here

EOF

ls -l ${folder}