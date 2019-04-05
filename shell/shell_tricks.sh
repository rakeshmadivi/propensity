#!/bin/bash

bold=$(tput bold)
italic=$(tput sitm)
normal=$(tput sgr0)
heading()
{
	#echo ${bold}$@${normal}
	echo -e "\n${italic}$@${normal}"
}

mystr="String Manipulation to be made on this string...."

# STRING MANIPULATION WITHIN PARAMETER SUBSTITUTION
string()
{
	#mystr="String Manipulation to be made on this string...."

	echo $mystr
	heading 'Length:'
	echo ${#mystr}

	# Delete shortest matching substring from beginning of string
	heading 'Delete Shortest matching Substring from FRONT-END:'
	echo ${mystr#*M}
	
	heading 'Delete Shortest matching Substring from BACK-END:'
	echo ${mystr%M*}

	heading "NOTE: Add one extra #/% to match the same for Longest Possible substring"

	heading "Replacing substring from FRONT-END:"
	echo ${mystr/#String/REPLACED}
	
	heading "Replacing substring from BACK-END:"
	echo ${mystr/%.../REPLACED}
}

# STRING MANIPULATION USING AWK
using_awk()
{
	# Equivalent to ${mystr:3:4}
	heading "Extract substring using AWK:"
	echo |awk '
	{ print substr("'"${mystr}"'",3,4)      # skid
	}
	'

	# Finding index of substring
	heading "Index of substring using AWK:"
	echo | awk '
	{ print index("'"${mystr}"'", "skid")      # 3
	}                                           # (skid starts at position 3)
	'
}

using_expr()
{
	mystr="Evaluating strings or expressions using EXPR command"

	heading 'Length:'
	echo $(expr length "$mystr")

	#echo Index: $(expr index $mystr strings )
	heading 'Index:'
	echo $mystr | grep -o -b uat
}

param_substitution()
{
	default=555
	heading "Parameter Substitutions:"

	heading "Using parameter-default"
	echo TODO

	heading "Using Default values for variables: \${var=default_val}"
	echo Uses default value if \'var1\' neither declared nor initialized: ${var1=$default}

	heading "Use Alteration value if var is set: \${var+default_val}"
	var=Rakesh
	echo Uses Alt value if \'var\' is set: ${var+$default}

	heading "Expand variable from given offset position and of given size: \${var:offset} \${var:offset:size}"
	var="the value of this variable"
	offset=4
	size=5
	echo Original value: $var
	echo Using Offset: ${var:$offset}
	echo Using offset and size: ${var:$offset:$size}

	heading "Replacing pattern in the variable expansion:"
	echo Replacing first match: ${var/this/THIS_REPLACED}
	echo Replacing all matches: ${var//th/TH_REPLACED}

	heading "Prefix and Suffix Replacements are done using #,% for sortest; ##,%% for longest pattern"
	echo Already Tested in string\(\) function

	heading "Indirect referencing variables: \${!var*} \${!var@}"
	var1=123
	var2=456
	var3=${!var*}	# var3=var1 var2
	echo var1: $var1 var2: $var2 var3: $var3
	# Same as above
	var3=${!var@}	# var3=var1 var2
	echo var1: $var1 var2: $var2 var3: $var3
}

special()
{
	# $*, $@, $$, $!, $?, $_, $-
	# $* Positional Paramters as single string separated by IFS(Internal Field Separator i.e., - )
	echo Arguments: $*

	# $@ Gives each paramter as separate word
	echo Arguments: $@

	# $# Count of positional parameters
	echo No.of Arguments: $#

	# $! Returns PID of Most Recently Executed Background Process
	sleep 2 &
	echo $!

	# $$ Returns PID of Shell
	echo $$

	# $? Returns exit status of most recently executed command
	echo $?

	# $- Options set using set builtin command
	echo $-

	# $_ Returns last argument of Previously executed command
	echo $_

}

string
using_expr
param_substitution

special "dfdljkf" 3 4 
