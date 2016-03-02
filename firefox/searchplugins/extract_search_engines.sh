#!/bin/sh

sed -n -e '/>Search Engine/,/^    <\/DL/p' bookmarks.html > search_engines.html
