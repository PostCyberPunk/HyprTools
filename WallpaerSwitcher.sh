#!/bin/bash
wallpaper_dir=$HOME/Pictures/wallpapers
source ~/.config/hypr/scripts/ChangeWallpaper.sh
cd $wallpaper_dir
result=$(find . -type f|fzf \
--reverse --header="WallPaperSwitcher" --preview-window=44% \
--preview='kitten icat --clear --transfer-mode=memory --place="$FZF_PREVIEW_COLUMNS"x"$FZF_PREVIEW_LINES"@$(math $COLUMNS+5)x1 --align center --stdin=no -z -1 {}')
change_wallpaper $result
exit 0
