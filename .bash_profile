#export PATH=/Applications/XAMPP/xamppfiles/bin:$PATH
export PATH=/usr/local:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"
# Amazon EB
export AWS_CREDENTIAL_FILE=/Users/nam/dev/aws
export ELASTICBEANSTALK_URL="https://elasticbeanstalk.ap-southeast-1.amazonaws.com"
# Homebrew PHP-CLI
export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"

export PATH=$PATH:/Users/nam/dev/AWS-ElasticBeanstalk/eb/macosx/python2.7
export PATH=$PATH:/Users/nam/dev/AWS-ElasticBeanstalk/api/bin
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
#[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
