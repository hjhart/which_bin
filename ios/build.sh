#!/bin/sh -ex 

# The below stuff will create a new phonegap app from scratch, wiping out the xcode stuff.
# You can uncomment it if you want to rebuild from another version, but steps need to be taken to reproduce it's old state
# (This would be adding the Flurry files into xCode)
# rm -rf build
# cd ~/Code/cordova-ios
# ./bin/create ~/Sites/eggs_in_the_bay/build org.EggWich EggWich
# cd ~/Sites/eggs_in_the_bay


cd www 
bundle exec rake assets:precompile
cd ../
pwd


JS_FILE=$(ruby -e 'puts `cat www/public/assets/manifest.yml | grep application.js`.split(": ").last')
CSS_FILE=$(ruby -e 'puts `cat www/public/assets/manifest.yml | grep application.css`.split(": ").last')
cp www/public/index.html build/www/
cp www/public/assets/cordova-2.5.0.js build/www/cordova-2.5.0.js
touch build/www/js/cordova-2.5.0.js
cp www/public/assets/$JS_FILE build/www/js/application.js
touch build/www/js/application.js
cp www/public/assets/$CSS_FILE build/www/css/application.css
touch build/www/css/application.css
cp -r www/public/img build/www
cp www/config/config.xml build/EggWich/config.xml


# Copy over icons and splash pages now
cp www/public/icons/* build/EggWich/Resources/icons/
cp www/public/splash/* build/EggWich/Resources/splash/

# Copy over flurry plugin headers and classes
#mkdir -p build/Flurry
#cp Flurry/Flurry.h build/Flurry/Flurry.h
#cp Flurry/libFlurry.a build/Flurry/libFlurry.a
#cp Flurry/flurry-phonegap-plugin/FlurryPhoneGapPlugin.h build/EggWich/Plugins/
#cp Flurry/flurry-phonegap-plugin/FlurryPhoneGapPlugin.m build/EggWich/Plugins/

# Remove the fresh assets
cd www 
bundle exec rake assets:clean
cd ../

# TODO: Will need to copy over the other assets like icons and splash screens!

# cd build/www
# heel .
# cd build

# ./cordova/run

