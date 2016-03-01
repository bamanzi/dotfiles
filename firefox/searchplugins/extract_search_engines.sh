#!/bin/sh

sed -n -e '1,/^    <\/DL/p' bookmarks.html > search_engines.html
