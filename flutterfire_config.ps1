# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

param(
    [string]$env = ""
)

if ($env -eq "") {
    Write-Host "Error: No environment specified. Use 'dev', or 'prod'."
    exit 1
}

switch ($env) {
    "dev" {
        flutterfire config `
            --project=<YOUR_PROJECT_ID> `
            --out=lib/firebase_options_dev.dart `
            --android-package-name=com.developer.fabian.crud_todo_app.dev `
            --android-out=android/app/src/develop/google-services.json
    }
    "prod" {
        flutterfire config `
              --project=<YOUR_PROJECT_ID> `
              --out=lib/firebase_options.dart `
              --android-package-name=com.developer.fabian.crud_todo_app `
              --android-out=android/app/src/production/google-services.json
    }
    default {
        Write-Error "Error: Invalid environment specified. Use 'dev', or 'prod'."
        exit 1
    }
}
