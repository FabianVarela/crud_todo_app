#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=<YOUR_PROJECT_ID> \
      --out=lib/firebase_options_dev.dart \
      --ios-bundle-id=com.developer.fabian.crudTodoApp.dev \
      --ios-out=ios/config/develop/GoogleService-Info.plist \
      --android-package-name=com.developer.fabian.crud_todo_app.dev \
      --android-out=android/app/src/develop/google-services.json \
      --macos-bundle-id=com.developer.fabian.crudTodoApp.dev \
      --macos-out=macos/config/develop/GoogleService-Info.plist
    ;;
  prod)
    flutterfire config \
      --project=<YOUR_PROJECT_ID> \
      --out=lib/firebase_options.dart \
      --ios-bundle-id=com.developer.fabian.crudTodoApp \
      --ios-out=ios/config/production/GoogleService-Info.plist \
      --android-package-name=com.developer.fabian.crud_todo_app \
      --android-out=android/app/src/production/google-services.json \
      --macos-bundle-id=com.developer.fabian.crudTodoApp \
      --macos-out=macos/config/production/GoogleService-Info.plist
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', or 'prod'."
    exit 1
    ;;
esac