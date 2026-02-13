# dot-files

#### GitHub Public Key

Generate new ssh key and add the public key to your GitHub.

```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Use this handy `.ssh/config` file to use multiple ssh keys for multiple GitHub accounts

```
# automatically add ssh keys to agent and keychain on first use
Host *
    UseKeychain yes
    AddKeysToAgent yes

# work account
Host github.com-work
	HostName github.com
	User git
	IdentityFile ~/.ssh/id_ed25519_work
	IdentitiesOnly yes

# personal account
Host github.com-marcjulianschwarz
	HostName github.com
	User git
	IdentityFile ~/.ssh/id_ed25519_marcjulianschwarz
	IdentitiesOnly yes
```

Then set your remotes for existing repos with

```bash
git remote set-url origin github.com-marcjulianschwarz:marcjulianschwarz/dot-files.git
```

or clone a repo with the correct URL directly

```bash
git clone github.com-marcjulianschwarz:marcjulianschwarz/dot-files
```

and override your global git username and email on a repo basis by running following two commands in the repo

```bash
git config user.email "your_email@example.com"
git config user.name "your_username"
```

You can now verify your setting with `cat .git/config`.

And if you forgot to add a password to your SSH keys... add a password to existing keys with

```bash
ssh-keygen -p -f ~/.ssh/id_ed25519
```

#### Oh-my-zsh

Symlink oh-my-zsh plugins and themes.

```
cd $HOME
rm -rf oh-my-zsh/custom
ln -s $HOME/Mac/GitHub/marcjulianschwarz/dot-files/oh-my-zsh/custom/plugins/me ~/.oh-my-zsh/custom/plugins
ln -s $HOME/Mac/GitHub/marcjulianschwarz/dot-files/oh-my-zsh/custom/themes/me.zsh-theme ~/.oh-my-zsh/custom/themes
```

Enable plugin and theme in `.zshrc` by adding `me` to the list of plugins and set theme to `me`.

## Ghostty

```
 ln -s "$HOME/Mac/GitHub/marcjulianschwarz/dot-files/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
```

## Micro

```
ln -s "$HOME/Mac/GitHub/marcjulianschwarz/dot-files/micro" "$HOME/.config/micro"
```

## TMUX

- `brew install tmux`
- https://github.com/gpakosz/.tmux

## VSCode

Add `code` to path.

```
cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
```

Backup Extensions from [illvart gist](https://gist.github.com/illvart/bf98de24cb2facfbc332269aadd149c8).

```
sudo chmod u+x get_ext.sh
sudo chmod u+x install_ext.sh
```

Then run with

```
./get_ext.sh
```

and

```
./install_ext.sh
```

## Install brew packages

```bash
brew install atuin
brew install db-browser-for-sqlite
brew install bat
brew install micro
brew install tree
```

## Install apps

See [my tools](https://marc-julian.com/#mytools).
