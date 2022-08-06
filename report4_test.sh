#!/bin/bash

function mytest {
  echo -n "Testing $1"
  if [[ $actual == $expected_result ]]; then
    echo " : OK"
  else
    echo " : NG"
    exit 1
  fi
}


# 2と4を入力する && 2を出力したら成功 || 出力しなかったらエラー
actual=$(./report4.sh 2 4)
expected_result=2

mytest "[2と4を入力する]"

# 3を入力する || エラーメッセージが出なかったらエラー
actual=$(./report4.sh 3)
expected_result="引数エラー: 3"

mytest "[3を入力する]"

# 文字を入力する || エラーメッセージが出なかったらエラー
actual=$(./report4.sh 文字)
expected_result="引数エラー: 文字"

mytest "[文字を入力する]"

# 引数の数が多いパターンのテスト
actual=$(./report4.sh 1 1 1)
expected_result="引数エラー: 1 1 1"

mytest "[引数の数が多いパターン]"

# 引数の数が少ないパターンのテスト
actual=$(./report4.sh 1)
expected_result="引数エラー: 1"

mytest "[引数の数が少ないパターン]"

# 負の数のパターンのテスト
actual=$(./report4.sh -1)
expected_result="引数エラー: -1"

mytest "[負の数のパターン]"

# 小数のパターンのテスト
actual=$(./report4.sh 0.1)
expected_result="引数エラー: 0.1"

mytest "[小数のパターン]"

