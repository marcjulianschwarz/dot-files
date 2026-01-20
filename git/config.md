automatically prune on all fetches

```bash
git config --global fetch.prune true
git fetch --prune
```

disable fetching for all branches

```bash
git config --unset remote.origin.fetch
```

default for fetching branches

```bash
# +refs/heads/*:refs/remotes/origin/*
```

```bash
git config remote.origin.fetch "+refs/heads/main:refs/remotes/origin/main"
```

```bash
git branch -dr
```

```bash
git branch -r    # Show all remote tracking branches
git branch -a    # Show both local and remote tracking branches
git fetch --prune
git remote prune origin
```
