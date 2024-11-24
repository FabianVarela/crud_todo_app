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

This app has been enabled with Android, iOS, Web, and macOS flavors with the below environments (develop and
production). For Windows (coming soon).

### Navigator 2.0

Actually the project has been implemented with **Navigator 2.0** or **Route API** from scratch (It doesn't use any
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
    * You must run the ```FlutterFire CLI``` command to configure your Firebase project. The project has 2
      environments `dev` and `production`.
        * If the project is `production`, you must run this command. Automatically, it creates a file with the
          name `lib/firebase_options.dart`
          ```bash
          flutterfire configure --project=<YOUR_PROJECT_ID>
          ```
        * If the project is `dev`, you must run this command. However, you must set the out file in this
          case `lib/firebase_options_dev.dart`
          ```bash
          flutterfire configure --project=<YOUR_PROJECT_ID> --out=lib/firebase_options_dev.dart
          ```
* Run project and enjoy :smile:

------

### Screenshots

| Platform | Preview                                               |
|----------|-------------------------------------------------------|
| Android  | ![android.gif](./assets/github_resources/android.gif) |
| iOS      | ![ios.gif](./assets/github_resources/ios.gif)         |
| macOS    | ![macos.gif](./assets/github_resources/macos.gif)     |
| Web      | ![web.gif](./assets/github_resources/web.gif)         |
| Windows  | Coming soon                                           |
