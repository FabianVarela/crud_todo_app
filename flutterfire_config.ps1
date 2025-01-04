# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if ($args.Count -eq 0) {
    Write-Error "Error: No environment specified. Use 'dev', or 'prod'."
    exit 1
}

param(
    [Parameter(Mandatory=$true)]
    [string]$Environment
)

switch ($Environment) {
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
