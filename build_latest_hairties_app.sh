#!/bin/bash

# Sucks down the latest 'hairties' repo, wraps the reviewer/ in phonegap app
# directory structure, and ships it off to be built into an Android app.
# Usage: just run the script.

set -e # die on first nonzero return value

hairties_repo_url="https://github.com/michaelgundlach/hairties"

echo "Verifying I'm where I think I should be"
[ $(pwd) == ~/code/hairties_phonegap ]

echo "Downloading latest hairties repo master commit from $hairties_repo_url"
rm -rf tmp && git clone --depth=1 "$hairties_repo_url" tmp 2> /dev/null

echo "Replacing our www folder with downloaded reviewer folder"
rm -rf www
mv tmp/reviewer www
# Change symlinked cards.js to copied, to make Phonegap happy
rm -f www/scripts/cards.js
cp tmp/inputter/cards.js www/scripts/cards.js
# Clean up
rm -rf tmp

# git diff returns 0 if no changes, 1 if changes
if git diff --exit-code www >/dev/null; then 
  echo
  echo
  echo "You have not changed the 'hairties' reviewer since the last time you"
  echo "ran this script, so it's likely that you already built the Android"
  echo "version and can just do the phone install."
  echo
  echo "Press enter to read the build instructions and phone instructions."
  read
else
  echo "Committing and pushing to hairties_phonegap repo"
  git add www
  git commit -m "build_latest_hairties_app.sh: commit" >/dev/null
  git push origin master 2>/dev/null
fi

echo
echo "OK, time to build the Android app."
echo
echo
echo "ON YOUR COMPUTER:"
echo
echo "1. Visit"
echo "  https://build.phonegap.com/people/sign_in"
echo "   and sign in with Adobe ID as g***.b***+omg@gmail.com"
echo "2. Visit"
echo "  https://build.phonegap.com/apps/2680026/builds"
echo "2. Click 'Update code' -> 'Pull latest' to start the build."
echo "3. Wait for the android 'Pending' to turn into a blue 'apk' button."
echo
echo
echo
echo "Then, ON YOUR PHONE:"
echo
echo "1. Open hairties.sorryrobot.com in Chrome on the phone"
echo "2. Click 'Get the latest app', then click the Android link."
echo
echo "If the install fails, make sure the phone allows 'Less Secure App Installs' or"
echo "something."
