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

This app has been enabled with Android, iOS, and Web flavors with the below environments (develop and production). For
macOS, flavors are not already supported
this is an [open issue related](https://github.com/flutter/flutter/issues/64088)

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
    * For iOS in XCode IDE, you select ```Runner``` and change the 'Bundle Identifier' text.
* You must run the ```FlutterFire CLI``` command
  ```bash
  flutterfire configure --project=<YOUR_PROJECT_ID>
  ```
* Run project and enjoy :smile:

------

### Used packages

#### Dependencies

- Firebase ([firebase_core](https://pub.dev/packages/firebase_core)
  , [cloud_firestore](https://pub.dev/packages/cloud_firestore))
- Riverpod ([hooks_riverpod](https://pub.dev/packages/hooks_riverpod))
- Hooks ([flutter_hooks](https://pub.dev/packages/flutter_hooks))
- Json annotation ([json_annotation](https://pub.dev/packages/json_annotation))
- Freezed annotation ([freezed_annotation](https://pub.dev/packages/freezed_annotation))
- Equatable ([equatable](https://pub.dev/packages/equatable))
- Intl ([intl](https://pub.dev/packages/intl))
- Google fonts ([google_fonts](https://pub.dev/packages/google_fonts))
- Flutter slidable ([flutter_slidable](https://pub.dev/packages/flutter_slidable))
- Context menus ([context_menus](https://pub.dev/packages/context_menus))
- Window size ([window_size](https://github.com/google/flutter-desktop-embedding/tree/master/plugins/window_size))
- Dart emoji ([dart_emoji](https://pub.dev/packages/dart_emoji))
- UUID ([uuid](https://pub.dev/packages/uuid))

#### Dev dependencies

- Build runner ([build_runner](https://pub.dev/packages/build_runner))
- Freezed ([freezed](https://pub.dev/packages/freezed))
- Json serializable ([json_serializable](https://pub.dev/packages/json_serializable))
- Mocktail ([mocktail](https://pub.dev/packages/mocktail))
- Mockito ([mockito](https://pub.dev/packages/mockito))
- Remove from coverage ([remove_from_coverage](https://pub.dev/packages/remove_from_coverage))
- Very Good Analysis ([very_good_analysis](https://pub.dev/packages/very_good_analysis))
