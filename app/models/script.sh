#! /bin/bash
echo "Geting fastai model"
curl -c /tmp/cookies "https://drive.google.com/uc?export=download&id=1-90WaE4SnAgrZzLA4av2-G5rNlP07Bxv" > /tmp/intermezzo.html
curl -L -b /tmp/cookies "https://drive.google.com$(cat /tmp/intermezzo.html | grep -Po 'uc-download-link" [^>]* href="\K[^"]*' | sed 's/\&amp;/\&/g')" > stage-2.pth
echo "Done!"
