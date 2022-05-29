# Flutter · CRUD TODO App

![Coverage](./coverage_badge.svg?sanitize=true)

Create a To-do List Flutter app managing CRUD with Firebase, using RiverPod as state management and dependency
injection.

### Getting Started (Firebase)

* To execute the app, you have to Firebase Project already created.
* Create an app in Firebase for Android iOS, Web and Desktop (Mac) with the existing project.
    * For Android you must rename the bundle Id on ```app/build.gradle```.
    * For iOS in XCode IDE, you select ```Runner``` and change the 'Bundle Identifier' text.
    * For Web, you must follow this [link](https://firebase.flutter.dev/docs/manual-installation/web#add-firebase-sdks)
    * For Desktop for Mac in XCode IDE, you select ```Runner``` and change the 'Bundle Identifier' text.

### Getting Started (Flutter)

* Clone this project.
* In Android, set ```google-services.json``` file in ```app``` folder.
* In iOS, set ```GoogleServices-Info.plist``` file in ```Runner``` folder.
* In Web, you must follow this [link](https://firebase.flutter.dev/docs/manual-installation/web#initializing-firebase)
* In Desktop for Mac, set ```GoogleServices-Info.plist``` file in ```Runner``` folder.
* Run project and enjoy :smile:

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

### Navigator 2.0

Actually the project has been implemented with **Navigator 2.0** or **Route API**.

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

### Responsive and Adaptive

This To-do app project uses responsive and adaptive principles to use it on different screen sizes and any devices, like
mobile phones, tablets, computers, notebooks, etc.

### Used packages

------

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

------

#### Help mockito reference

Mockito Null Safety recipe [link](https://github.com/dart-lang/mockito/blob/master/NULL_SAFETY_README.md)
