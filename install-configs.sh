#!/bin/bash
echo "### 开始配置环境 ###"

# 判断 git 命令是否存在
hash git >/dev/null 2>&1 || { echo "require git but it's not installed."; exit 2; }

if [ -f ~/.gitconfig ] ; then
  echo "~/.gitconfig already exists, get the existing username and email first"
  git_username=$(git config --global user.name)
  git_useremail=$(git config --global user.email)
  echo "user = $git_username"
  echo "email = $git_useremail"
fi

echo "\ncopying .gitconfig..."
cp -f git/my.gitconfig ~/.gitconfig || { echo "!! failed to cp gitconfig"; exit 2; }
echo "done"

# 恢复 user.name user.email 的值
if [ ${git_username:+x} ] ; then
	git config --global user.name "$git_username"
  echo "set back git username to $git_username"
fi

if [ ${git_useremail:+x} ] ; then
	git config --global user.email "$git_useremail"
  echo "set back git email to $git_useremail"
fi

echo "\n复制 oh-my-zsh 主题和个人 zsh 配置"
cp -f zsh/amuse.zsh-theme ~/.oh-my-zsh/themes/ || { echo "!! failed to cp amuse.zsh-theme"; exit 2; }
cp -f zsh/my.zshrc ~/.zshrc || { echo "!! failed to cp my.zshrc"; exit 2; }
echo "完成!"

echo "\n### 所有安装都已完成 :) ###"