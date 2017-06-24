## Phonegap build wrapper

Phonegap build wrapper around the github/michaelgundlach/hairties/reviewer flashcard project.

## To build the phonegap app
The hairties API server (found in the hairties/server folder) must be up and running at http://hairties.sorryrobot.com/api/.

Steps:
 1.  Run ./import_hairties.sh to download the latest master 'hairties' from github. 
 2.  git commit -am "Imported latest hairties" && git push origin master # to github hairties_phonegap project, not hairties project
 3.  Visit build.phonegap.com/apps (sign in with Adobe ID g***.b***+omg@gmail.com), click Update Code or something to fetch the latest hairties_phonegap code from github and build the Android version
 4.  Download the Android .apk that was built, and either
    1. expose it on the web and visit in Android Chrome (perhaps put it in github hairties_phonegap project root as a new commit) or
    2. Put it on the Google Play Store somehow.
