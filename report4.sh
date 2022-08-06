#!/bin/bash

#最大公約数を計算するシェルスクリプトと、その動作を確認するシェルスクリプトを作成し、GitHubに上げ、TravisCIまたはGitHub actionsで動作確認を行う

#引数は二つであるかをチェック
check_num(){
  if [ $# != 2 ]; then
    echo 引数エラー: $*
    exit 1
  else
    return 0
  fi
}


# 自然数バリデーション
check_natural_number() {
  input=$1

  if [[ "$input" =~ ^[0-9]+$ ]];then
    return 0
  else
    echo "$input is not a number"
    exit 1
  fi


}

# 最大公約数の計算
gcd() {
    while [ !  0 -eq "$2" ]; do
            set -- "$2" "`expr "$1" % "$2"`"
        done
        echo "$1"
}

# main
check_num $*
check_natural_number $1
check_natural_number $2
gcd $1 $2

