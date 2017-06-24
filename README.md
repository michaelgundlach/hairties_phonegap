## Phonegap build wrapper

This is a Phonegap build wrapper around the github/michaelgundlach/hairties/reviewer flashcard project.  /reviewer runs fine on the web (see hairties.sorryrobot.com/reviewer/); this repo makes it run as an Android app.

## To build the Android app

Run ./build_latest_hairties_app.sh to build.

Note that the app won't work unless the hairties API server (found in the hairties/server folder) is up and running at http://hairties.sorryrobot.com/api/.

## Files

build_latest_hairties_app.sh automates getting the build done.

config.xml is the metadata.
icon.png is the icon.
www/ contains the app (and gets overwritten with the latest reviewer code by the build script)
