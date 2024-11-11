#!/bin/bash

screen_select_to_buffer() {
  maim -s | xclip -selection clipboard -t image/png
  notify-send 'Screenshot' 'Screen Selection copied to buffer'
}

print_screen() {
  maim ~/Pictures/Screenshots/$(date +%d-%b-%Y-%H:%M.%N).png
  notify-send "Screenshot" "Screenshot saved as $(date +%d-%b-%Y-%H:%M:%N)"
}

screen_to_buffer() {
  maim | xclip -selection clipboard -t image/png
  notify-send "Screenshot" "Screen copied to buffer"
}

save_selection() {
  maim -s ~/Pictures/Screenshots/$(date +%d-%b-%Y-%H:%M:%N)-selection.png
  notify-send "Screenshot" "Screenshot saved as $(date +%d-%b-%Y-%H:%M:%N)-selection.png"
}

case "$1" in
--screenshot)
  print_screen
  ;;
--screen-selection-buffer)
  screen_select_to_buffer
  ;;
--save-selection)
  save_selection
  ;;
--screen-to-buf)
  screen_to_buffer
  ;;
esac
