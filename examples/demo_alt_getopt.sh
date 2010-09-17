#!/bin/sh

# this is a demo for alt_getopt(1) program, not for alt_getopt.awk module!

help () {
    cat 1>&2 <<EOF
blablabla help
EOF
}

process_args (){
    alt_getopt \
	'v|verbose' 'verbose=1' \
	'h help'    help \
	'fake'      fake_flag=1 \
	'=len'      len= \
	'=o output' output= \
	'=m msg'    "msg=" \
	'V version' "echo 'alt_getopt-0-1-0, written by Aleksey Cheusov <vle@gmx.net>'" \
	f           'flag=1' \
	F           'flag=' \
	=n          number= \
	-- "$@"
}

a=`process_args "$@"`

eval "$a"

echo "verbose=$verbose"
echo "fake_flag=$fake_flag"
echo "len=$len"
echo "output=$output"
echo "msg=$msg"
echo "n=$number"
echo "flag=$flag"

i=1
while test $# -ne 0; do
    printf "arg [%d]=%s\n" "$i" "$1"
    i=`expr $i + 1`
    shift
done
