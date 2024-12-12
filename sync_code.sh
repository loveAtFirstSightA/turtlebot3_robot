#!/bin/bash

# 获取当前路径
current_dir=$(pwd)

rm -f README.md

log_info(){
    echo "$1"
    echo "$1" >> $current_dir/README.md
}

log_info "代码同步日志："
sync_time=$(date '+%Y-%m-%d %H:%M:%S')
log_info "代码同步时间：$sync_time"
echo ""

for dir in "$current_dir/src/"*; do
    # 检查路径是否是文件夹
    if [ -d "$dir" ]; then
        repo_name=$(basename "$dir")
        log_info "仓库 - $repo_name"
        # 进入仓库目录，检查cd是否成功
        cd "$dir" || { log_info "无法进入目录 $dir"; continue; }
        # 获取当前分支名称
        branch=$(git rev-parse --abbrev-ref HEAD)
        log_info "    分支 - $branch"
        # 执行git pull操作，并捕获输出
        git_pull_output=$(git pull)
        log_info "$git_pull_output"
        log_info ""  # 添加空行分隔
        # 返回脚本所在目录
        cd "$current_dir" || { log_info "返回 $current_dir 失败"; exit 1; }
    fi
done
