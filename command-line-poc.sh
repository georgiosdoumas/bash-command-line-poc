#!/bin/bash

usagec12() {
  echo "command01|command02 some-verb some-action"
}

usagec1v() {
  echo "command01 verb01|verb02 some-action"
}

usagec2v() {
  echo "command02 verb01|verb02 some-action"
}

usagec1v1() {
  echo "command01 verb01 action01|action02"
}

usagec1v2() {
  echo "command01 verb02 action01|action02"
}

usagec2v1() {
  echo "command02 verb01 action3|action4"
}

usagec2v2() {
  echo "command02 verb02 action3|action4"
}

func_c1() {
  case "$2" in 
    "verb01") func_c1v1 $1 $2 $3
              exit ;;
    "verb02") func_c1v2 $1 $2 $3 
              exit ;;
    *) echo $1 $2 $3 bad combination
       usagec1v
       exit ;;
  esac
}

func_c2() {
    case "$2" in 
    "verb01") func_c2v1 $1 $2 $3
              exit ;;
    "verb02") func_c2v2 $1 $2 $3 
              exit ;;
    *) echo $1 $2 $3 bad combination
       usagec2v
       exit ;;
  esac
}

func_c1v1() {
case "$3" in 
  "action01") echo "$1 will perform $2 on $3"
              exit ;;
  "action02") echo "$1 to initiate $2 to $3"
              exit ;;
  *) echo $1 $2 $3 bad combination
     usagec1v1
     exit ;;
esac
}

func_c1v2() {
case "$3" in 
  "action01") echo "$1 will perform $2 on $3"
            exit ;;
  "action02") echo "$1 to initiate $2 to $3"
            exit ;;
  *) echo $1 $2 $3 bad combination
     usagec1v2
     exit ;;
esac
}

func_c2v1() {
case "$3" in 
  "action3") echo "$1 will perform $2 on $3"
            exit ;;
  "action4") echo "$1 to initiate $2 to $3"
            exit ;;
  *) echo $1 $2 $3 bad combination
     usagec2v1
     exit ;;
esac
}

func_c2v2() {
case "$3" in 
  "action3") echo "$1 will perform $2 on $3"
            exit ;;
  "action4") echo "$1 to initiate $2 to $3"
            exit ;;
  *) echo $1 $2 $3 bad combination
     usagec2v2
     exit ;;
esac
}

##### Start of script here ####
## command plus args must be 3 
ACCEPTED_NUM_OF_ARGS=3   # must have no space around = 
if [ $# -ne $ACCEPTED_NUM_OF_ARGS ]; then 
  if [ $# -eq 1 ]; then 
    echo "You gave only the command"
  elif [ $# -eq 2 ]; then 
    echo "You gave only the command and 1 arg"
  else 
    echo "You gave 3 or more args on $1"
  fi
fi


case "$1" in 
  "command01") func_c1 $1 $2 $3
               exit ;;
  "command02") func_c2 $1 $2 $3
               exit ;;
  *) echo $1 $2 $3 bad combination
     usagec12
     exit ;;
esac

