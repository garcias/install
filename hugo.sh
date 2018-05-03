#! /bin/bash

API_URL=https://api.github.com/repos/gohugoio/hugo/releases
RELEASE_ID=`curl $API_URL/latest | jq '.id '`
ASSET_ID=`curl $API_URL/$RELEASE_ID/assets | jq -r '.[] | "\(.id) \(.name)"' | grep "Linux-64bit.deb" | grep -o "^[0-9]* "`
ASSET_URL=`curl $API_URL/assets/$ASSET_ID | jq -r '.browser_download_url'`
wget $ASSET_URL
sudo dpkg -i hugo*.deb
hugo version && rm hugo*.deb
sudo hugo gen autocomplete
. /etc/bash_completion
