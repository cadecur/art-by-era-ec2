#! /bin/bash
sudo systemctl daemon-reload
sudo systemctl start cs121
sudo systemctl restart cs121
sudo systemctl enable cs121
sudo systemctl start nginx
sudo systemctl restart nginx
