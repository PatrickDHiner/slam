#!/bin/bash

tracker_list=$(curl -Ns https://github.com/XIU2/TrackersListCollection/raw/master/all.txt https://github.com/ngosang/trackerslist/raw/master/trackers_all.txt https://newtrackon.com/api/all https://github.com/DeSireFire/animeTrackerList/raw/master/AT_all.txt https://github.com/hezhijie0327/Trackerslist/raw/main/trackerslist_combine.txt https://torrends.to/torrent-tracker-list/?download=latest | awk '$0' | tr '\n\n' ',')
aria2c --enable-rpc --check-certificate=false \
   --max-connection-per-server=16 --rpc-max-request-size=1024M --bt-max-peers=0 \
   --bt-stop-timeout=0 --min-split-size=10M --follow-torrent=mem --split=10 \
   --daemon=true --allow-overwrite=true --max-overall-download-limit=0 --bt-tracker="[$tracker_list]"\
   --max-overall-upload-limit=1K --max-concurrent-downloads=30 --continue=true \
   --peer-id-prefix=-qB4380- --user-agent=qBittorrent/4.3.8 --peer-agent=qBittorrent/4.3.8 \
   --disk-cache=32M --bt-enable-lpd=true --seed-time=0 --max-file-not-found=0 \
   --max-tries=20 --auto-file-renaming=true --reuse-uri=true --http-accept-gzip=true \
   --content-disposition-default-utf8=true --netrc-path=/usr/src/app/.netrc
