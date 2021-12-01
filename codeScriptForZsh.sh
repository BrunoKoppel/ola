function codeStatus {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		cd ~/codevault/$var1/$var2
		echo '\n\n\x1b[36mREPOSITORY NAME: '$var2' \\\\ Category: '$var1'\x1b[0m'
		echo '\x1b[36mDIR: '$(pwd)'\x1b[0m'
		echo '\x1b[36mGITHUB PRINTOUT\x1b[0m\n'
		git status;
		cd ~/codevault;
	done < list.txt
	echo '\n\t\x1b[32mFinished Successfully!\x1b[0m\n'
}

function codePush {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		cd ~/codevault/$var1/$var2
		echo '\n\n\x1b[36mREPOSITORY NAME: '$var2' \\\\ Category: '$var1'\x1b[0m'
		echo '\x1b[36mDIR: '$(pwd)'\x1b[0m'
		echo '\x1b[36mGITHUB PRINTOUT\x1b[0m\n'
		git push;
		cd ~/codevault;
	done < list.txt
	echo '\n\t\x1b[32mFinished Successfully!\x1b[0m\n'
}

function codePull {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		cd ~/codevault/$var1/$var2
		echo '\n\n\x1b[36mREPOSITORY NAME: '$var2' \\\\ Category: '$var1'\x1b[0m'
		echo '\x1b[36mDIR: '$(pwd)'\x1b[0m'
		echo '\x1b[36mGITHUB PRINTOUT\x1b[0m\n'
		git pull;
		cd ~/codevault;
	done < list.txt 
	echo '\n\t\x1b[32mFinished Successfully!\x1b[0m\n'
}

function codeClone {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line 
		cd ~/codevault
		generateDirectory $var1
		cd $var1
		git clone $var3
		echo '\n\n\x1b[36mREPOSITORY NAME: '$var2' \\\\ Category: '$var1'\x1b[0m'
		echo '\x1b[36mDIR: '$(pwd)'\x1b[0m'
		echo '\x1b[36mGITHUB PRINTOUT\x1b[0m\n'
		git status;
		cd ~/codevault;
	done < list.txt
	echo '\n\t\x1b[32mFinished Successfully!\x1b[0m\n'
}

function codeAddAll {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line 
		cd ~/codevault/$var1/$var2
		echo '\n\n\x1b[36mREPOSITORY NAME: '$var2' \\\\ Category: '$var1'\x1b[0m'
		echo '\x1b[36mDIR: '$(pwd)'\x1b[0m'
		echo '\x1b[36mGITHUB PRINTOUT\x1b[0m\n'
		git add .;
		cd ~/codevault;
	done < list.txt 
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
		# -t  | --teleport  ) cd ~/;;
		-*  | *           ) echo '\n\t\tunknown flag option provided' 
					printHelpMenu;;
	esac
	shift
done
