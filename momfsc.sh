#!/bin/bash

# momfsc.sh "My Own M*****F******* Syntax Checker" is written and Maintained by Joseph T. Manning
# out of a desperate need to seek and destroy pernicious Bash bugs with some semblance of efficiency.
# All rights reserved, just in case, but for the time being, please use, abuse, improve, and comment.
# September 1, 2016




INPUT=$1
	tput setaf 5
	printf "Checking parentheses.\n"
	tput setaf 9 
	p1=`grep -o \( $INPUT | wc -l`
	p2=`grep -o \) $INPUT | wc -l`
	p=$(( p1 - p2 ))
	if [ $p == 0 ] ; then
	tput setaf 2
	printf "\tNo unmatched parenthesis.\n"
	tput setaf 9
	else
	tput setaf 1
 	printf "\tUnmatched parenthesis. Check lines:\n $( grep -n -e \( -e \) "$INPUT" )\n"
	tput setaf 9
	fi
	tput setaf 9
	tput setaf 5
	printf "Checking single quotes.\n"
	tput setaf 9 
	q1=`grep -o \' $INPUT | wc -l`
	q=$(( q1 % 2 ))
	if [ $q == 0 ] ; then
	tput setaf 2
	printf "\tNo unmatched single quotes.\n"
	tput setaf 9
	else
	tput setaf 1
	 printf "\tUnmatched single quote. Check lines:\n $( grep -n \' "$INPUT" )\n"
	tput setaf 9
	fi

	tput setaf 5
	printf "Checking double quotes.\n"
	tput setaf 9 
	dq1=`grep -o \" $INPUT | wc -l`
	dq=$(( dq1 % 2 ))
	if [ $dq == 0 ] ; then
	tput setaf 2
	printf "\tNo unmatched double quotes.\n"
	tput setaf 9
	else
	tput setaf 1
	printf "\tUnmatched double quote. Check lines:\n $( grep -n \" "$INPUT" )\n"
	tput setaf 9
	fi

	tput setaf 5
	printf "Checking brackets.\n"
	tput setaf 9 
	bk1=`grep -o \\\[ $INPUT | wc -l`
	bk2=`grep -o \\\] $INPUT | wc -l`
	bk=$(( bk1 - bk2 ))
	if [ $bk == 0 ] ; then
	tput setaf 2
	printf "\tNo unmatched brackets.\n"
	tput setaf 9
	else
	tput setaf 1
	printf "\tUnmatched brackets. Check lines:\n $( grep -n -e \\\[ -e \\\] "$INPUT" )\n"
	tput setaf 9
	fi
	tput setaf 5
	printf "Checking braces.\n"
	tput setaf 9 
	bc1=`grep -o \{ $INPUT | wc -l`
	bc2=`grep -o \} $INPUT | wc -l`
	bc=$(( bc1 - bc2 ))
	if [ $bc == 0 ] ; then
	tput setaf 2
	printf "\tNo unmatched braces.\n"
	tput setaf 9
	else
	tput setaf 1 
	printf "\tUnmatched brace. Check lines:\n $( grep -n -e \{ -e \} "$INPUT" )\n"
	tput setaf 9
	fi

	tput setaf 5
	printf "Checking backticks.\n"
	tput setaf 9 
	bt1=`grep -o \\\` $INPUT | wc -l`
	bt=$(( bt1 % 2 ))
	if [ $bt == 0 ] ; then
	tput setaf 2
	printf "\tNo unmatched backticks.\n"
	tput setaf 9
	else
	tput setaf 1
	printf "\tUnmatched backticks. Check lines:\n $( grep -n '`' "$INPUT" )\n"
	tput setaf 9
	fi

	tput setaf 5
	printf "Checking if//fi matches.\n"
	tput setaf 9 
	f1=`grep -ow if $INPUT | wc -l`
	f2=`grep -ow fi $INPUT | wc -l`
	f=$(( f1 - f2 ))
	if [ $f == 0 ] ; then
	tput setaf 2
	printf "\tNo unmatched if statements.\n"
	tput setaf 9
	else
	tput setaf 1
	printf "\tUnmatched if statement. Check lines:\n $( grep -n -e if -e fi "$INPUT" )\n"
	tput setaf 9
	fi

	tput setaf 5
	printf "Checking do//done matches.\n"
	tput setaf 9 
	d1=`grep -ow do $INPUT | wc -l`
	d2=`grep -ow done $INPUT | wc -l`
	d=$(( d1 - d2 ))
	if [ $d == 0 ] ; then
	tput setaf 2
	printf "\tNo unmatched do statements.\n"
	tput setaf 9
	else
	tput setaf 1
	printf "\tUnmatched do statement. Check lines:\n $( grep -n -e do -e done "$INPUT" )\n"
	tput setaf 9
	fi
	tput setaf 3
printf "$(wc -l $INPUT) lines checked.\n"
	tput setaf 9
exit 0
