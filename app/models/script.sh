#! /bin/bash
echo "Geting fastai model"
curl -c /tmp/cookies "https://drive.google.com/open?id=1iv_6OMZ94tm9auDlrYZ94WQ1QiQrKF9z" > /tmp/intermezzo.html
curl -L -b /tmp/cookies "https://drive.google.com$(cat /tmp/intermezzo.html | grep -Po 'uc-download-link" [^>]* href="\K[^"]*' | sed 's/\&amp;/\&/g')" > stage-2-50.pkl
echo "Done!"
