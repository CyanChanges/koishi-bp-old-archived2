#!/bin/bash
bwrap \
  `# no zombies` \
  --die-with-parent \
  \
  `# network required for dependencies` \
  --unshare-all \
  --share-net \
  \
  `# create enviroment for a properly running shell` \
  --tmpfs / \
  --tmpfs /run \
  --dir /tmp \
  --dev /dev \
  --proc /proc \
  --ro-bind /bin /bin \
  --ro-bind /sbin /sbin \
  --ro-bind /usr /usr \
  --ro-bind /etc /etc \
  --ro-bind /lib /lib \
  --ro-bind /lib64 /lib64 \
  --ro-bind /sys /sys \
  --ro-bind /var /var \
  \
  `# current dir is assumed to be project dir and full access is allowed` \
  --bind "$(pwd)" "$(pwd)" \
  \
  `# command provided by user. zsh, npm install or etc` \
  "$@"
