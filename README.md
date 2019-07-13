# How to setup your Raspberry Pi with Raspbian

### Prerequisites
1. Git
2. Python
3. Raspbian

### Base Instagram Bot Installation Steps
1. Clone this repo to your desktop.
2. Unzip Instabot-Local within the repo.
3. Move the Instabot-Local folder, Instagram-Bot-Updater.sh, Instagram-Bot-Runner.sh to your desktop.
4. Clone https://github.com/instagrambot/instabot.git to your desktop.
5. Double-click Instagram-Bot-Updater.sh, and select "Execute in Terminal". This will run the update script, and upgrade your local copy with the latest bot code from the community. This will also be ran until explicitly stopped.
6. Now we want to update the following scripts with your instagram account login credentials. Change bot.login(username="USERNAME", password="PASSWORD", proxy="") to the username and password of the desired account, in the following scripts: unfollow_non_followers.py, like_timeline_feed.py, comment_hashtags.py, like_hashtags.py, follow_last_user_media_likers.py, and follow_users_by_hashtag.py. All of these are under Instabot-Local/examples or Instabot-Local/examples/comment.
7. Double-click Instagram-Bot-Runner.sh, and select "Execute in Terminal". This will start your bot in terminal and run indefinitely, until stopped.

### What To Watch Out For
1. If you change the folder names on Instabot-Local or instabot, it will break your scripts.
2. You're welcome to update more in the example scripts in the base instructions above, just update the runner to call your new scripts.
3. Feel free to parameterize the login inputs, rather than actually hardcoding in each file. I accept Pull Requests!
4. The update script simply updates the executional logic for the Instagram API within Instabot, rather than the interface login call python files, which is how this works.
5. If you update the script to run faster you will run the risk of being temporarily banned for a certain action by Instagram.
