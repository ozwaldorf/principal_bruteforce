#!/bin/bash
trap 'pkill -TERM -P $$ && rm -rf tmp' EXIT
printf "→ Principal ID Bruteforce ↴\n\n"
if [[ -z $2 ]]; then
 printf "$0 <number of threads> prefix_string [string2 ...]"; exit 1
fi
spinner () {
  spin='⋅˖+┼╋┼+˖'; i=0
  while true 2>/dev/null; do
    i=$(( (i+1) %8 ))
    printf "\r ${spin:$i:1} ... Generating identities ... ${spin:$i:1} "
    sleep .1
  done
}
check () {
  string=$1; shift
  for prefix in "$@"; do
    case "$string" in "$prefix"*) #*"$prefix"* to match anywhere in the principal
      return 1;;
    esac
  done
  return 0
}
gen () {
  TEMP_HOME=.$(mktemp -u)
  mkdir -p $TEMP_HOME
  cd $TEMP_HOME
  principal="\n"
  while $(check "$principal" ${@}); do
    rm seed.txt 2>/dev/null
    keysmith generate
    principal=$(keysmith principal)
  done
  printf "\n\nFound Principal ID! : %s\n" "$principal"
  keysmith private-key
  dir=${principal:0:11}; mkdir -p ../../$dir; cp * ../../$dir
  cd ../..
  printf "Saved to $PWD/$dir/\n\n\a"
}
procs=$1 && shift
for x in $(seq $procs); do gen $@ 2>/dev/null & done
spinner & wait -n #remove -n to complete every thread (generate x ids)
