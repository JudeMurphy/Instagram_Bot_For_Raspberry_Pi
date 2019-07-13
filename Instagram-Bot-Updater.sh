#1/bin/bash

#Written by Jude Murphy

#Steps Before Running This Script
#1. Clone https://github.com/instagrambot/instabot to your Desktop
#2. Follow the README.md to this
#3. Change what you need to for the below script

#Timer for checking GitHub for Latest Code - Edit this for shorter/longer timeouts as desired
timeout=86400

#Keeping track of a count just to see how many times this has ran
count=1

while :
do
{
#Add the correct Instagram Bot folder name:
   cd instabot
   echo "--------------------------"
   echo "Run Number: $count"   
   echo "Grabbing Latest Bot Code"
   git pull
   echo "--------------------------"
   cd ..

#Add the correct Instagram Bot folder name:
   cd Instabot-jude.murphy
   rm -rf instabot
   cd ..

#Add your local paths for instabot, and your personal instabot fold name, below - I've added mine as examples:
   cp -R /home/pi/Desktop/instabot/instabot /home/pi/Desktop/Instabot-jude.murphy/instabot

   sleep $timeout
   count=$(($count+1))

#Clears Command Prompt
   history -c
   clear
}

done
