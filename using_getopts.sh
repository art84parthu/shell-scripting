#!/bin/bash
usage="$(basename "$0") [-h] [-r OPTION_DESC] [-c ANOTHER_OPTION] [-d YET_ANOTHER_OPTION] -- program to do whatever!

where:
    -h show this help text
    -r option that takes an argument. explain what option you need here
    -c another_option that takes argument.
    -d yet_another_option that does not take any argument."


arg1=''
arg2=''

while getopts ':hr:c:d' option; do
     case "$option" in
        h) echo "$usage"
           exit
           ;;
        c) arg1=$OPTARG
           if [[ $arg1 != '' ]]; then
                echo "you gave argument for option -c = $arg1"
           else
                printf "missing argument for -c\n" "$OPTARG" >&2
                echo "$usage" >&2
                exit 1
           fi
           ;;
        r) arg2=$OPTARG
           if [[ $arg2 != '' ]]; then
              echo "you gave argument for option -r = $arg2"
           else
              printf "missing argument for -r\n" "$OPTARG" >&2
              echo "$usage" >&2
              exit 1
           fi
           ;;
        d) echo "you gave the option -d which will be handled here!"
           ;;
       \?) printf "illegal option: -%s\n" "$OPTARG" >&2
           echo "$usage" >&2
           exit 1
           ;;
     esac
done
shift $((OPTIND -1))

if [[ $arg1 == '' || $arg2 == '' ]]; then
    printf "missing argument(s)! check usage" >&2
    echo "$usage" >&2
fi

