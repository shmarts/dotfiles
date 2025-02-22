#!/bin/bash

while [[ "$#" -gt 0 ]]
  do
    case $1 in
      -f|--focus)
        if [ "$2" = "prev" ]
        then
          pos=-1
        else
          pos=1
        fi
        ;;
    esac
    shift
  done

pos=${pos:-1}

focus="$(yabai -m query --windows | \
  jq -e --argjson pos "${pos}" '
    first(.[] | select(."has-focus")) as {id:$id, space:$space}
      | map( select( ."is-floating" and .space == $space) )
      | sort_by(.frame.x, .frame.y)
      | map(.id)
      | .[( (index($id) // if $pos == 1 then -1 else length end) + $pos ) % length]
  ')"

yabai -m window --focus "$focus"
