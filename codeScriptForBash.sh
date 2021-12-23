#!/bin/bash

version="0.2.1"
code_directory=$code_directory
list_directory=$list_directory
list_file=$list_filename

function codeStatus {
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/$code_directory/$var1/$var2
			echo -e '\n\e[1;36m'$var2' @ '$code_directory'/'$var1' :: Results: \e[0m'
			git status;
			cd ~/$code_directory;
			# echo -e '\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < ~/$list_directory/$list_file
}

function codePush {
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/$code_directory/$var1/$var2
			echo -e '\n\e[1;36m'$var2' @ '$code_directory'/'$var1' :: Results: \e[0m'
			git push;
			cd ~/$code_directory;
			echo -e '\n\t\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < ~/$list_directory/$list_file
}

function codePull {
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/$code_directory/$var1/$var2
			echo -e '\n\e[1;36m'$var2' @ '$code_directory'/'$var1' :: Results: \e[0m'
			git pull;
			cd ~/$code_directory;
			echo -e '\n\t\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < ~/$list_directory/$list_file
}

function codeClone {
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/$code_directory
			generateDirectory $var1
			cd $var1
			git clone $var3
			cd $var3
			echo -e '\n\e[1;36m'$var2' @ '$code_directory'/'$var1' :: Results: \e[0m'
			git status;
			cd ~/$code_directory;
			echo -e '\n\t\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < ~/$list_directory/$list_file
	
}

function codeAddAll {
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/$code_directory/$var1/$var2
			echo -e '\n\e[1;36m'$var2' @ '$code_directory'/'$var1' :: Results: \e[0m'
			git add .;
			cd ~/$code_directory;
			echo -e '\n\t\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < ~/$list_directory/$list_file 
	
}

function generateDirectory {
	if [ ! -d "$1" ]; then	
		mkdir "$1"
	fi 
}

function printHelpMenu {
echo -e 'OLTRAG CLI Version' $version
echo -e 'One Line To Rule All Gits!\n
Command Examples:
oltrag -s
oltrag --pull
oltrag --clone **Careful with this one. Use it only when you are setting up your repos in a new computer.
oltrag --push\n
List of flags available:
[ -s  | --status   ] Gets the Status for all repos
[ -ps | --push     ] Pushes the commits to all repos
[ -pl | --pull     ] Pulls the latest commits on all repos
[ -cl | --clone    ] Clones all repos, handy in the event of losing all your code!
[ -a  | --add      ] Adds all untracked files to their repos\n\n'
}

if [ $# == 0 ]; then	
	printHelpMenu
fi

 
while [ -n "$1" ]; do
	case "$1" in
		-s  | --status    ) codeStatus;;
		-ps | --push      ) codePush;;
		-pl | --pull      ) codePull;;
		-cl | --clone     ) codeClone;;
		-a  | --add       ) codeAddAll;;
		-*  | *           ) echo 'FLAG PROVIDED DOES NOT CORRESPOND TO ANY ACTION' 
	esac
	shift
done
