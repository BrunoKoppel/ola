# OLTRAG: [One Line To Rule All Git](http://brunokoppel.com/blog/04/)

Branch off from the original oltrag Project

<img src="./oltrag-CLI.png" alt="Pretty neat huh?" />

Have you ever wanted to pull, status, or push, all your git repos at once with just one command?

Well! Now you can!

## Setup

## 1. First clone this repo ```git@github.com:BrunoKoppel/oltrag.git```

## 2. Add an alias to your terminal profile (Personally I like to use ```ola``` instead of ```oltrag```, faster to type):

### MacOs\Linux\Unix\gitbash Terminals

- zsh: ```alias oltrag='~/WHERE_YOUR_SCRIPT_GOT_CLONED/codeScriptForZsh.sh' >> .zprofile```
- bash: ```alias oltrag='~/WHERE_YOUR_SCRIPT_GOT_CLONED/codeScriptForBash.sh' >> .bash_profile```

### Windows Terminals

- Sorry, I'm working on a port for powershell at the moment.

## 3. Define 3 system variables in your `.bash_profile` or `.bashrc`:

export list_directory='WHERE_YOUR_LIST_IS'
export code_directory='WHERE_YOUR_CODE_IS'
export list_file='FILENAME_OF_YOUR_LIST'

Here is a few shortcuts:
- ```export list_directory='WHERE_YOUR_LIST_IS' >> .bash_profile```
- ```export code_directory='WHERE_YOUR_CODE_IS' >> .bash_profile```
- ```export list_file='FILENAME_OF_YOUR_LIST' >> .bash_profile```

Just make sure to pass the right names that you are using in your system.

## Command Examples

- ```oltrag -s || oltrag --status``` git status in all your repos.
- ```oltrag -pl || oltrag --pull``` git pull in all your repos.
- ```oltrag -cl || oltrag --clone``` git clone in all your repos, for when setting up new computers.
- ```oltrag -ps || oltrag --push``` git push in all your repos.
- ```oltrag -a || oltrag --add``` git add . in all your repos
<!-- - ```oltrag -t || oltrag --teleport``` Would take you to the directory, but for some reason wasn't working (Coming soon) -->

## How to set up the list of repos?

Use the Example list to get an idea of how to set them up, but basically it follows 3 parameters

``` pseudo
[encapsulating_directory] [repo_directory_name] [github_ssh or github_http]
[encapsulating_directory] [repo_directory_name] [github_ssh or github_http]
[encapsulating_directory] [repo_directory_name] [github_ssh or github_http]
```

For example I have mine set up to be:

```pseudo
scripts todoistScript git@github.com:BrunoKoppel/Todoist-script.git
research RPi01-RoboDoge git@github.com:BrunoKoppel/RPi01-RoboDoge.git
research RPi02-Robotexa git@github.com:BrunoKoppel/RPi02-Robotexa.git
```

The idea is that the script reads each line:

1. First argument is the directory where the repo is saved in.
2. Second argument is the name of the directory that the git clone generates.
3. Third and last argument is the gitHub link.
