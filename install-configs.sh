#!/bin/bash
echo "### 开始配置环境 ###"

hash git >/dev/null 2>&1 || { echo "!! git not installed, cannot continue"; exit 2; }

echo "\n复制 oh-my-zsh 主题和个人 zsh 配置"
cp -f zsh/amuse.zsh-theme ~/.oh-my-zsh/themes/ || { echo "!! failed to cp amuse.zsh-theme"; exit 2; }
cp -f zsh/my.zshrc ~/.zshrc || { echo "!! failed to cp my.zshrc"; exit 2; }
echo "完成!"

echo "\n### 所有安装都已完成 :) ###"