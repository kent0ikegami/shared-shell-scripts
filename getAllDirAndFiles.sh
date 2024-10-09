#!/bin/bash

# 出力ディレクトリ
output_dir="/home/username/hoge"
mkdir -p $output_dir

# ファイル名
date_str=$(date +"%Y%m%d_%H%M%S")
output_file="$output_dir/output_$date_str.csv"

# 情報の取得先
input_dirs=("/home/username/hoge" "/home/username/fuga")

# 情報の取得とCSV出力
find "${input_dirs[@]}" \
  -exec ls -ld --time-style="+%Y-%m-%d %H:%M:%S" {} + | \
awk '
  BEGIN {OFS=","}
  {
    $6=$6" "$7; $7=""; # 日付と時刻を結合
    filename="";
    for (i=8; i<=NF; i++) filename = filename (i==8 ? "" : " ") $i; # ファイル名を連結
    print $1,$2,$3,$4,$5,$6,filename # 必要な情報を出力
  }' >> $output_file

# ファイル名順に外部ソートして同じファイルに保存
sort -t, -k7,7 --buffer-size=20% --temporary-directory=/tmp -o "$output_file" "$output_file"
