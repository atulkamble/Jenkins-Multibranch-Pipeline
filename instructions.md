1) fork repo https://github.com/atulkamble/Jenkins-Multibranch-Pipeline
2) update dockerhub username in deploy.sh
3) Update credentials id in Jenkinsfile
3) Create Multibranch pipeline 

New Item >> Multibranch pipeline 
display name >> Jenkins-Multibranch-Pipeline
Branch Sources >> Add source >> GitHub

https://github.com/settings/tokens | Setting >> Dev Setting >> Create access token 

update username and password 

Repo HTTP URL >> (tip: add your repo url )

https://github.com/atulkamble/Jenkins-Multibranch-Pipeline.git

SCAN REPO >> 
