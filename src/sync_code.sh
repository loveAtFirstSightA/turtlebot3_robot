#!/bin/bash

# 获取当前路径
current_dir=$(pwd)

# 创建或覆盖README.md文件，开始写入日志
echo "代码同步日志：" > "$current_dir/README.md"
# 同时打印到控制台
echo "代码同步日志："

# 输出代码同步时间（精确到秒），并写入README.md
sync_time=$(date '+%Y-%m-%d %H:%M:%S')
echo "代码同步时间：$sync_time" >> "$current_dir/README.md"
# 同时打印到控制台
echo "代码同步时间：$sync_time"
echo ""

# 遍历当前路径下的每个文件夹
for dir in "$current_dir"/*; do
    # 检查路径是否是文件夹
    if [ -d "$dir" ]; then
        repo_name=$(basename "$dir")
        echo "仓库 - $repo_name" >> "$current_dir/README.md"
        echo "仓库 - $repo_name"
        
        # 切换到文件夹路径
        cd "$dir"
        
        # 获取当前分支名称
        branch=$(git rev-parse --abbrev-ref HEAD)
        echo "    分支 - $branch" >> "$current_dir/README.md"
        echo "    分支 - $branch"
        
        # 执行git pull操作，并捕获输出
        git_pull_output=$(git pull)
        echo "$git_pull_output" >> "$current_dir/README.md"
        echo "$git_pull_output"
        
        echo "" >> "$current_dir/README.md"
        echo ""
        
        # 返回上级目录
        cd ..
    fi
done

