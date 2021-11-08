function codeStatus {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/codevault/$var1/$var2
			echo -e '\n\n\e[1;36m'$var1' :: '$var2'\e[0m'
			echo -e '\e[1;36mDirectory: '$(pwd)'\e[0m'
			echo -e '\e[1;36mResults: \e[0m\n'
			git status;
			cd ~/codevault;
			echo -e '\n\t\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < list.txt
}

function codePush {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/codevault/$var1/$var2
			echo -e '\n\n\e[1;36m'$var1' :: '$var2'\e[0m'
			echo -e '\e[1;36mDirectory: '$(pwd)'\e[0m'
			echo -e '\e[1;36mResults: \e[0m\n'
			git push;
			cd ~/codevault;
			echo -e '\n\t\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < list.txt	
}

function codePull {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/codevault/$var1/$var2
			echo -e '\n\n\e[1;36m'$var1' :: '$var2'\e[0m'
			echo -e '\e[1;36mDirectory: '$(pwd)'\e[0m'
			echo -e '\e[1;36mResults: \e[0m\n'
			git pull;
			cd ~/codevault;
			echo -e '\n\t\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < list.txt 
}

function codeClone {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/codevault
			generateDirectory $var1
			cd $var1
			git clone $var3
			echo -e '\n\n\e[1;36m'$var1' :: '$var2'\e[0m'
			echo -e '\e[1;36mDirectory: '$(pwd)'\e[0m'
			echo -e '\e[1;36mResults: \e[0m\n'
			git status;
			cd ~/codevault;
			echo -e '\n\t\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < list.txt
	
}

function codeAddAll {
	cd ~/codevault/.commands
	while read line;
		do 
		IFS=' ' read var1 var2 var3 <<< $line
		if [[ -n $var1 ]] && [[ $var1 != '#' ]]; then
			cd ~/codevault/$var1/$var2
			echo -e '\n\n\e[1;36m'$var1' :: '$var2'\e[0m'
			echo -e '\e[1;36mDirectory: '$(pwd)'\e[0m'
			echo -e '\e[1;36mResults: \e[0m\n'
			git add .;
			cd ~/codevault;
			echo -e '\n\t\e[1;32mFinished Successfully!\e[0m\n'
		fi
	done < list.txt 
	
}

function generateDirectory {
	if [ ! -d "$1" ]; then	
		mkdir "$1"
	fi 
}

function printHelpMenu {
	echo -e '\n
\tCodeVault CLI v0.2\n
\tManage all of your repositories with this CLI, one command to rule them all!\n
\t\tflags available:\n
\t\t[ -s  | --status   ] Gets the Status for all repos
\t\t[ -ps | --push     ] Pushes the commits to all repos
\t\t[ -pl | --pull     ] Pulls the latest commits on all repos
\t\t[ -cl | --clone    ] Clones all repos, good for when I lose all my code!
\t\t[ -a  | --add      ] Adds all untracked files to their repos\n'
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
		-t  | --teleport  ) cd ~/codevault;;
		-*  | *           ) echo -e '\n\t\tunknown flag option provided' 
					printHelpMenu;;
	esac
	shift
done
