# Flutter · CRUD TODO App

![Coverage](./coverage_badge.svg?sanitize=true)

Create a To-do List Flutter app managing CRUD with Firebase, using RiverPod as state management and dependency injection.

Actually the project has been implemented with **Navigator 2.0**.

### Getting Started (Firebase)
* To execute the app, you have to Firebase Project already created.
* Create an app in Firebase for Android iOS, Web and Desktop (Mac) with the existing project.
    * For Android you must rename the bundle Id on ```app/build.gradle```.
    * For iOS in XCode IDE, you select ```Runner``` and change the 'Bundle Identifier' text.
    * For Web, you must follow this [link](https://firebase.flutter.dev/docs/installation/web#add-firebase-sdks)
    * For Desktop for Mac in XCode IDE, you select ```Runner``` and change the 'Bundle Identifier' text.

### Getting Started (Flutter)
* Clone this project.
* In Android, set ```google-services.json``` file in ```app``` folder.
* In iOS, set ```GoogleServices-Info.plist``` file in ```Runner``` folder.
* In Web, you must follow this [link](https://firebase.flutter.dev/docs/installation/web#initializing-firebase)
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
 
### Used packages

------
#### Dependencies
- Firebase (firebase_core, cloud_firestore)
- Hooks (flutter_hooks) 
- Riverpod (hooks_riverpod)
- Equatable (equatable)
- Intl (intl)
- Flutter Emoji (flutter_emoji)
- UUID (uuid)
- Flutter Slidable (flutter_slidable)

#### Dev dependencies
- Freezed (freezed, freezed_annotation)
- Mocktail (mocktail)
- Mockito (mockito)
- Very Good Analysis (very_good_analysis)
------

#### Help mockito reference

Mockito Null Safety recipe [link](https://github.com/dart-lang/mockito/blob/master/NULL_SAFETY_README.md)
