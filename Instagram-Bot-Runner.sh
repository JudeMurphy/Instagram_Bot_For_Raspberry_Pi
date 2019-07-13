#1/bin/bash

#Written by Jude Murphy

#Steps
#1. This script will run unendingly, and should be kicked off AFTER all of the prerequisites in the README.md file and in the Instagram-Bot-Update.sh script are met.

#This should be the name of the folder that hold the local copy of your bot with your custom login for your account
cd Instabot-Local
cd examples

#Timeout between operations - Change as desired, but to be safe, you may want to keep this at 20 minutes (1200 seconds)
timeout=1200
count=1

#EACH SCRIPT CALLED BELOW SHOULD BE CHANGED TO HAVE A HARDCODED LOGIN FOR YOUR ACCOUNT - OTHERWISE THIS WON'T WORK
#GO TO YOUR LOCAL COPY ON INSTABOT AND CHANGE THE SCRIPTS LOGIN AS DESIGNATED IN THE README.MD
while :
do
{
   echo "--------------------------"
   echo "Run Number: $count"
   echo "--------------------------"

   if [ `expr $count % 2` -eq 0 ]
   then
       echo "--------------------------"
       echo "BE RIGHT BACK - TAKING A BREAK - SLEEPING"
       echo "--------------------------"
       sleep 7200
       echo "--------------------------"
       echo "3 HOUR WAIT COMPLETED - RESTARTING BOT"
       echo "--------------------------"
   fi

   if [ `expr $count % 25` -eq 0 ]
   then
       echo "--------------------------"
       echo "BE RIGHT BACK - TAKING A BREAK - SLEEPING"
       echo "--------------------------"
       sleep 43200
       echo "--------------------------"
       echo "HALF A DAY WAIT COMPLETED - RESTARTING BOT"
       echo "--------------------------"
   fi

   if [ `expr $count % 50` -eq 0 ]
   then
       #Unfollow Non-Followers
       python unfollow_non_followers.py
       echo "--------------------------"
       echo "ENDED UNFOLLOWING NON-FOLLOWERS - SLEEPING"
       echo "--------------------------"  
   fi

   #Like My Followers
   python like_timeline_feed.py 
   echo "--------------------------"
   echo "ENDED LIKING MY TIMELINE - SLEEPING"
   echo "--------------------------"
   wait
   sleep $timeout

   #Comment On My Posts Related To My Niche
   cd comment
   rm instabot.log
   python comment_hashtags.py comments.txt photography travelphotography
   cd ..
   echo "--------------------------"
   echo "ENDED COMMENTING BY HASHTAGS - SLEEPING"
   echo "--------------------------"
   sleep $timeout

   #Like All Hashtags Related To My Bot's Niche
   python like_hashtags.py instapic photographer photography
   echo "--------------------------"
   echo "ENDED LIKING HASHTAGS - SLEEPING"
   echo "--------------------------"  
   sleep $timeout

   #Follow All Users Related To My Bot
   python follow_last_user_media_likers.py 
   echo "--------------------------"
   echo "ENDED FOLLOWING LAST USER MEDIA LIKERS - SLEEPING"
   echo "--------------------------"
   sleep $timeout

   #Like My Followers
   python like_timeline_feed.py 
   echo "--------------------------"
   echo "ENDED LIKING MY TIMELINE - SLEEPING"
   echo "--------------------------"
   sleep $timeout

   #Follow Users That Might Like What I Like
   python follow_users_by_hashtag.py photography
   echo "--------------------------"
   echo "ENDED LIKING HASHTAGS - SLEEPING"
   echo "--------------------------"  
   sleep $timeout

   echo "--------------------------"
   echo "ENDED FULL RUN"
   echo "--------------------------"

   count=$(($count+1))

   history -c
   clear
}

done
