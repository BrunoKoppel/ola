#!/bin/zsh

version="0.2"
code_directory=$code_directory
list_directory=$list_directory
list_file=$list_filename

function codeStatus {
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/$code_directory/$var1/$var2
			echo '\n\n\x1b[36m'$var2' @ '$code_directory'/'$var1' :: Results: \x1b[0m'
			git status;
			cd ~/$code_directory;
		fi
	done < ~/$list_directory/$list_file
	echo '\n\t\x1b[32mFinished Successfully!\x1b[0m\n'
}

function codePush {
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/$code_directory/$var1/$var2
			echo '\n\n\x1b[36m'$var2' @ '$code_directory'/'$var1' :: Results: \x1b[0m'
			git push;
			cd ~/$code_directory;
		fi
	done < ~/$list_directory/$list_file
	echo '\n\t\x1b[32mFinished Successfully!\x1b[0m\n'
}

function codePull {
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/$code_directory/$var1/$var2
			echo '\n\n\x1b[36m'$var2' @ '$code_directory'/'$var1' :: Results: \x1b[0m'
			git pull;
			cd ~/$code_directory;
		fi
	done < ~/$list_directory/$list_file
	echo '\n\t\x1b[32mFinished Successfully!\x1b[0m\n'
}

function codeClone {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line 
		cd ~/$code_directory;
		generateDirectory $var1
		cd $var1
		git clone $var3
		cd $var3
		echo '\n\n\x1b[36m'$var2' @ '$code_directory'/'$var1' :: Results: \x1b[0m'
		git status;
		cd ~/$code_directory;
	done < ~/$list_directory/$list_file
	echo '\n\t\x1b[32mFinished Successfully!\x1b[0m\n'
}

function codeAddAll {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line 
		cd ~/$code_directory/$var1/$var2
		echo '\n\n\x1b[36m'$var2' @ '$code_directory'/'$var1' :: Results: \x1b[0m'
		git add .;
		cd ~/$code_directory;
	done < ~/$list_directory/$list_file
	echo '\n\t\x1b[32mFinished Successfully!\x1b[0m\n'
}

function generateDirectory {
	if [ ! -d "$1" ]; then	
		mkdir "$1"
	fi 
}

function printHelpMenu {
	echo "\n\
\tOLTRAG CLI v0.2\n
\tManage all of your repositories with this CLI, one command to rule all git!\n
\t\tflags available:\n
\t\t[ -s  | --status   ] Gets the Status for all repos
\t\t[ -ps | --push     ] Pushes the commits to all repos
\t\t[ -pl | --pull     ] Pulls the latest commits on all repos
\t\t[ -cl | --clone    ] Clones all repos, good for when I lose all my code!
\t\t[ -a  | --add      ] Adds all untracked files to their repos\n"
}

if [ $# = 0 ]; then	
	printHelpMenu
fi

 
while [ -n "$1" ]; do
	case "$1" in
		-s  | --status    ) codeStatus;;
		-ps | --push      ) codePush;;
		-pl | --pull      ) codePull;;
		-cl | --clone     ) codeClone;;
		-a  | --add       ) codeAddAll;;
		# -t  | --teleport  ) cd ~/;;
		-*  | *           ) echo '\n\t\tunknown flag option provided' 
					printHelpMenu;;
	esac
	shift
done
