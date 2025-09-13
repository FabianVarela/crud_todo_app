# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

param(
    [string]$env = "",
    [string]$projectId = ""
)

if ($env -eq "")
{
    Write-Host "Error: Invalid environment specified. You must use 'dev', or 'prod'."
    exit 1
}

if ($projectId -eq "")
{
    Write-Host "Error: You must set the Firebase's project id."
    exit 1
}

switch ($env)
{
    "dev" {
        flutterfire config `
              --project=$projectId `
              --out=lib/firebase_options_dev.dart `
              --ios-bundle-id=com.developer.fabian.crudTodoApp.dev `
              --ios-out=ios/config/develop/GoogleService-Info.plist `
              --android-package-name=com.developer.fabian.crud_todo_app.dev `
              --android-out=android/app/src/develop/google-services.json `
              --macos-bundle-id=com.developer.fabian.crudTodoApp.dev `
              --macos-out=macos/config/develop/GoogleService-Info.plist
    }
    "prod" {
        flutterfire config `
              --project=$projectId `
              --out=lib/firebase_options.dart `
              --ios-bundle-id=com.developer.fabian.crudTodoApp `
              --ios-out=ios/config/production/GoogleService-Info.plist `
              --android-package-name=com.developer.fabian.crud_todo_app `
              --android-out=android/app/src/production/google-services.json `
              --macos-bundle-id=com.developer.fabian.crudTodoApp `
              --macos-out=macos/config/production/GoogleService-Info.plist
    }
    default {
        Write-Error "Error: Invalid environment specified. You must use 'dev', or 'prod'."
        exit 1
    }
}
