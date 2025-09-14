# Flutter · CRUD TODO App

![Coverage](./coverage_badge.svg?sanitize=true)

Create a To-do List Flutter app managing CRUD with Firebase, using RiverPod as state management and dependency
injection.

------

## Features

### Responsive and Adaptive

This To-do app project uses responsive and adaptive principles to use it on different screen sizes and any devices, like
mobile phones, tablets, computers, notebooks, etc.

### Flavors

This app has been enabled with Android, iOS, Web, macOS, and Windows. Also, enable flavors with the below environments
(develop and production).

### Navigator 2.0

Currently, the project has been implemented with **Navigator 2.0** or **Route API** from scratch (It doesn't use any
packages).

#### Deep linking

For using deep links with flutter without any packages, review
this [link](https://flutter.dev/docs/development/ui/navigation/deep-linking)

Run deep links in **iOS**, use the command below:

```bash
xcrun simctl openurl booted crudtodoapp://crudtodoexample.com/categories/{categoryId}/todo/{todoId}
```

Run deep links in **Android**, use the command below:

```bash
~/Library/Android/sdk/platform-tools/adb shell am start -a android.intent.action.VIEW \ -c android.intent.category.BROWSABLE \ -d crudtodoapp://crudtodoexample.com/categories/{categoryId}/todo/{todoId}
```

------

### Firebase Scheme

    ├── categories
      ├── id (generated)
        ├── emoji (String)
        ├── name (String)
        ├── todoSize (Number)

    ├── todos
      ├── id (generated)
        ├── categoryId (String)
        ├── finalDate (Number)
        ├── isCompleted (Boolean)
        ├── subject (String)

------

## Getting Started

### Firebase

* You must have a Firebase Project already created.
* You must install ```firebase tools``` and ```FlutterFire CLI``` on your local machine.
    * To install ```firebase tools```, could you
      guide [here](https://firebase.google.com/docs/cli?authuser=0&hl=es#install_the_firebase_cli)
    * After install ```firebase tools```, you must log in with your Google account.
    * To install ```FlutterFire CLI```, you must run the command below.
      ```bash
      dart pub global activate flutterfire_cli
      ```

### Flutter

* Clone this project.
* If you want to rename the bundles for each platform, you must do the steps below.
    * For Android, you must rename the bundle id on ```app/build.gradle```.
    * For iOS and macOS in XCode IDE, you select ```Runner``` and change the 'Bundle Identifier' text.
    * You must run the ```flutterfire_config.sh``` file, to configure your Firebase project. But before you must follow
      these steps.
        * Also, you must rename the bundle-id (for iOS and macOS) and package name (for Android) with yours.
    * The project has 2 environments `development` and `production`.
        * You must run this command for macOS.
          ```bash
          bash flutterfire_config.sh <environment> <firebase-project-id>
          ```
        * You must run this command for Windows.
          ```powershell
           .\flutterfire_config.ps1 <environment> <firebase-project-id>
           ```
      Replace `<environment>` with `prod` if the project is `production`, and with `dev` if it is `development`.
      Automatically, it creates a file with the required files.
* Run project and enjoy :smile:

### Unit testing and coverage

To execute the unit testing and show the coverage, you must run the `test_coverage` file by console.

#### Mac and Linux

Before to run the script, you must have installed the `lcov` package.

For macOS, via `brew` (you must have the home brew already installed).

```bash
brew install lcov
```

For Linux use the command below.

```bash
sudo apt -y install lcov
```

After, you must run the `test_coverage.sh`.

```bash
bash test_coverage.sh
```

#### Windows

Before to run the script, you must have installed the `lcov` package via `chocolatey` (you must have the chocolatey
already installed).

```powershell
choco install lcov
```

After, you must run the `test_coverage.ps1`. If running the `ps1` file you have an error, you must run as administrator
the `PowerShell` and type the command below.

```powershell
Set-ExecutionPolicy RemoteSigned
```

And finally, run the `ps1` script.

```powershell
.\test_coverage.ps1
```

------

### Screenshots

| Platform | Preview                                               |
|----------|-------------------------------------------------------|
| Android  | ![android.gif](./assets/github_resources/android.gif) |
| iOS      | ![ios.gif](./assets/github_resources/ios.gif)         |
| macOS    | ![macos.gif](./assets/github_resources/macos.gif)     |
| Web      | ![web.gif](./assets/github_resources/web.gif)         |
| Windows  | ![windows.gif](./assets/github_resources/windows.gif) |
