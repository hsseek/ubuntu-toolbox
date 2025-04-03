#!/bin/bash
word=$(xsel --clipboard)
#firefox "https://ja.dict.naver.com/#/search?query=$word"
firefox "https://papago.naver.com/?sk=ja&tk=ko&hn=0&st=$word"
