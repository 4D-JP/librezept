#!/bin/bash
echo "download 4D.dmg"
curl $1 --location --output 4D.dmg
echo "mount 4D"
hdiutil mount 4D.dmg
echo "copy 4D.app"
cp -R /Volumes/4D/4D.app ./4D.app
git clone https://github.com/miyako/4d-class-build-application.git compiler

echo "launch 4D.app"
4D.app/Contents/MacOS/4D --dataless --project ${PWD}/compiler/Project/compiler.4DProject --user-param eyJwcm9qZWN0IjoiUHJvamVjdC9saWJyZXplcHQuNERQcm9qZWN0Iiwib3B0aW9ucyI6eyJ0YXJnZXRzIjpbIng4Nl82NF9nZW5lcmljIiwiYXJtNjRfbWFjT1NfbGliIl0sInR5cGVJbmZlcmVuY2UiOiJsb2NhbHMiLCJkZWZhdWx0VHlwZUZvck51bWVyaWMiOjEsImRlZmF1bHRUeXBlRm9yQnV0dG9ucyI6OSwiZ2VuZXJhdGVTeW1ib2xzIjp0cnVlLCJnZW5lcmF0ZVR5cGluZ01ldGhvZHMiOiJyZXNldCIsImNvbXBvbmVudHMiOltdfX0= --headless
echo "unmount 4D"
hdiutil detach /Volumes/4D
