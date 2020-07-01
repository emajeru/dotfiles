# Functions
function docker-bash() { docker exec -it "$1" /bin/bash; }
function python-virtual-on() { source "${1}/bin/activate"; }
function start() { open /Applications/${1}.app; }
function sshup() {
	(cd ~ && ssh-add -A $(ls -1 ~/.ssh | egrep -i '^id.*[^.pub]$' | xargs -n 1 -I {} echo ~/.ssh/{}))
}

function qurl() {
	RESULT=$(curl -s $@)
	if [ $RESULT ]
	then
		echo $RESULT | jq -C
	fi
}

function change-directory-new() {
	if [ ! -z ${1} ]
	then
		mkdir -p ${1}
		cd ${1}
	else
		echo "No path selected"
	fi
}

function change-directory-foreground() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

function siteroot() {
	ROOT="${HOME}/Sites"
	EDITOR="subl"
	USAGE_PROMPT="Syntax: siteroot -[r | o | t | e | l] <sitename>\n\t-r   Print the site's root folder.\n\t-o   Open the root folder in Finder.\n\t-t   Change directory to the root folder.\n\t-e   Open folder using editor.\n\t-l   List all available site folders."
	FLAG=${1}
	
	if [ ${2} ]
		then 
		SITEROOT=${2}
		case $FLAG in
			-r ) echo "${ROOT}/${SITEROOT}" && return;;
			-o ) open "${ROOT}/${SITEROOT}" && return;;
			-t ) cd "${ROOT}/${SITEROOT}" && return;;
			-e ) "${EDITOR}" "${ROOT}/${SITEROOT}" && return;;
			* ) echo "${USAGE_PROMPT}"
		esac
	elif [ ${1} ]
		then
		if [ -e "${ROOT}/${1}" ]; then
			cd "${ROOT}/${1}"
		else
			echo "No Valid Site folder in path ${ROOT}/${1}"
		fi
		
		# SITEROOT=${1}
		# if [ $SITEROOT ]
		# 	then
		# 	subl "${ROOT}/${SITEROOT}"
		# fi
	else
		echo "${USAGE_PROMPT}"
	fi
}


function git-dupe() {
	ARGS=("$@")
	if [ "$#" -gt 2 ]
	then
		REPO="${ARGS[2]}"
		DEST="${ARGS[3]}"
	else 
		REPO="${ARGS[1]}"
		DEST="${ARGS[2]}"
	fi

	echo "Working on ${REPO}"
	while IFS= read -d $'\0' i
	do
		if [ "$#" -gt 2 ] && [ "${ARGS[1]}" = "-z" ]
		then
			echo "Processing $i"
		fi

		if [ -d "${REPO}/$i" ]
		then
			mkdir -p "${DEST}/$i"
		else
			cp "${REPO}/$i" "${DEST}/$i"
		fi
	done < <(git -C "${REPO}" --work-tree="." ls-tree -trz --name-only --full-name master)

	echo "Copying git repository"
	cp -R "${REPO}/.git" "${DEST}/"
}

function git-init() {
	if ! [ -e .git ]; then
		USAGE_PROMPT="Usage: git-init [-nr | <git repo url>]\nExample: git-init git@github.com:user/project.git\nExample: git-init -nr"
		
		echo "Adding initial files..."
		touch README.md CHANGELOG.md TODO.md

		git init 1> /dev/null

		if ! [ -z $1 ]; then
			case $1 in
				-nr ) ;;
				http*.git|git*.git ) git remote add origin $1;;
				* ) echo $USAGE_PROMPT;;
			esac
		else
			echo -n "Add remote origin or (n) to set later: "
			read RESPONSE

			case $RESPONSE in
				n ) ;;
				http*.git|git*.git ) git remote add origin ${RESPONSE};;
				* ) echo "No valid repo provided. Please set this manually";;
			esac
		fi

		echo "Staging and committing repo..."
		git add .
		git commit -m "Initial Commit" 1> /dev/null

		echo "$fg_bold[green]New repo ready 👨🏾‍💻 🎊"
	else
		echo "There is already a git repo in the current directory"
	fi
}

function git-push() {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
		git add . 1> /dev/null
		git commit -m $1 1> /dev/null
		git push
	else
		echo "You're not in a git repo 🤷🏾‍♂️"
	fi
}

function git-commit() {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
		git add . 1> /dev/null
		git commit -m $1 1> /dev/null
	else
		echo "You're not in a git repo 🤷🏾‍♂️"
	fi
}

function git-obliterate() {
	if [ -z $1 ]; then
		git filter-branch -f --index-filter "git rm --cached $file --ignore-unmatch" --prune-empty --tag-name-filter cat -- --all
		echo "$file" >> .gitignore
		git add .gitignore
		git commit -m "Add $file to .gitignore"
	else
		echo "File required." 1>&2
	fi
}

# Display virtual environment info
function virtualenv_prompt {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    virtualenv=`basename "$VIRTUAL_ENV"`
    echo -e "$VIRTUALENV_CHAR$virtualenv "
  fi
}

function prompt_command() {
	# %{$fg[red]%}%m%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %(!.#.$)
	# \n${icon_start}$(virtualenv_prompt)${icon_user}${bold_red}\u${normal}${icon_host}${bold_cyan}\h${normal}${icon_directory}${bold_purple}\W${normal}\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on ${icon_branch}  \")${white}$(scm_prompt_info)${normal}\n${icon_end}

  PS1="
%B%F{31}${icon_start}%{$reset_color%}%F{black}%K{31}  %T %F{}%K{}$(virtualenv_prompt)${icon_user}%B%F{31}%n%{$reset_color%} ${icon_point} %F{251}${icon_directory}%1~%{$reset_color%}\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" ${icon_point}%F{172} ${icon_branch} \$(git_prompt_info) \$(git_prompt_short_sha)%{$reset_color%}\")
%B%F{31}${icon_end}%{$reset_color%}"
  PS2="%B%F{31}${icon_end}%{$reset_color%}"
}
