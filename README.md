# OLTRAG: [One Line To Rule All Git](http://brunokoppel.com/blog/04/)

Branch off from the original CodeVault Project

<img src="./oltrag-CLI.png" alt="Pretty neat huh?" />

Have you ever wanted to pull, status, or push all your git repos all at once with one command? 

Well! Now you can! Using the code.sh script within .commands you can accomplish this.

## Setup

1. First clone this repo ```git@github.com:BrunoKoppel/oltrag.git```

2. Add the script to your terminal profile (Personally I like to use ```cva``` instead of ```codevault``` just shorter):

### MacOS Terminals

- zsh: ```alias codevault='~/codevault/.commands/codeScriptForMacOS.sh' >> .zprofile```
- bash: ```alias codevault='~/codevault/.commands/codeScriptForMacOS.sh' >> .bash_profile```

### Linux\Unix Terminals

- zsh: ```alias codevault='~/codevault/.commands/codeScriptForUnix.sh' >> .zprofile```
- bash: ```alias codevault='~/codevault/.commands/codeScriptForUnix.sh' >> .bash_profile```

### Windows Terminals

Coming... At some point.. I think I'll do a python universal script If I don't get to understand batch scripts.

## Commands

- ```codevault -s``` or ```codevault --status``` git status in all your repos (1st favorite command)
- ```codevault -pl``` or ```codevault --pull``` git pull in all your repos (2nd favorite command)
- ```codevault -cl``` or ```codevault --clone``` git clone in all your repos
  - This command is perfect for when you are setting up your code base in a new computer.
- ```codevault -ps``` or ```codevault --push``` git push in all your repos
  - Useful when you've set a lot of commits ready to be pushed.
- ```codevault -a``` or ```codevault --add``` git add . in all your repos
  - Barely use this one unless I've done little work around all the repos.
- ```codevault -t``` or ```codevault --teleport``` Would take you to the directory, but for some reason wasn't working (Coming soon)

## How to set up the list of repos?

Create a file with the name ```list.txt``` in the .command/ folder, right next to code.sh. Now the idea is to have each repo that you mantained *specified in the following way*.

```pseudo
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

## Feel free to clone and take the Script beyond its initial form!

If you take a look at the script you will see how easy it is setup. It may take you a few minutes to reporsue it but the advantages save you hours.
