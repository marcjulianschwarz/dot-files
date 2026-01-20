# dot-files

#### GitHub Public Key

Generate new ssh key and add the public key to your GitHub.

```
ssh-keygen -t ed25519 -C "your_email@example.com"
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
