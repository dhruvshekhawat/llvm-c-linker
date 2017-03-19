#!/bin/bash
# If the terminal shows "can't find command", please run "chmod +x gridrun.sh" in terminal first.
LLI="lli"

GRID_NATIVE="./microc.native"

DEFAULT_PATH="."

Run() {
	eval $*
}

Usage(){
	echo "Usage: gridrun.sh [options] [.grid file]"
    #echo "-a   Print AST of file"
    echo "-c   Compile file"
    echo "-r   Run file"
    echo "-h   Print this help"
    exit 1
}

CompileFile(){
	IFS='.' read -ra SPLIT_ARRAY <<< "$1"
    basename=`echo ${SPLIT_ARRAY[0]}`
    echo "# compiling ${basename}.grid"
    Run "$GRID_NATIVE" "<" $1 ">" "${DEFAULT_PATH}/${basename}.ll"
    echo "     ${basename}.ll ... Done"
    Run "$LLI" "${DEFAULT_PATH}/${basename}.ll" ">" "${DEFAULT_PATH}/${basename}.out"
    echo "     ${basename}.out ... Done"
}

RunProgram(){
    IFS='.' read -ra SPLIT_ARRAY <<< "$1"
    basename=`echo ${SPLIT_ARRAY[0]}`
    Run "$GRID_NATIVE" "<" $1 ">" "${DEFAULT_PATH}/${basename}.ll"
    echo "# Executing ${basename}.grid ..."
    Run "$LLI" "${DEFAULT_PATH}/${basename}.ll"
}
MODE="Help";
while getopts crh x; do
    case $x in
	c) # Compile
		MODE="Compile"
		;;
	r) # Run
		MODE="Run"
		;;
	h) # Help
	    Usage
	    ;;
	*) #Help if no opt given
		Usage
		;;
    esac
done
#shift `expr $OPTIND - 1`
file=`echo $2`

case $MODE in
Compile)
    CompileFile $file
    ;;
Run)
    RunProgram $file
    ;;
Help)
	Usage
	;;
esac