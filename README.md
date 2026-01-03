# CRUD TODO App

![Coverage](./coverage_badge.svg?sanitize=true)

Flutter application for managing tasks with full CRUD operations using Firebase Firestore. Built with Riverpod for state
management, custom Navigator 2.0 implementation, and supporting all major platforms with responsive/adaptive design.

## Prerequisites

Before getting started, make sure you have the following installed:

- **Flutter SDK**: >=3.10.0 <4.0.0
- **Dart SDK**: >=3.10.0 <4.0.0
- **IDE**: VSCode or Android Studio with Flutter extensions
- **Firebase Account**: Required for Firestore database
- **Firebase CLI**: For Firebase configuration
- **FlutterFire CLI**: For automated Firebase setup
- **Platforms**:
    - For iOS: Xcode (macOS only)
    - For Android: Android Studio or Android SDK
    - For macOS: Xcode
    - For Web: Google Chrome
    - For Windows: Visual Studio 2019 or later

## Initial Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd crud_todo_app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Install Firebase Tools

#### Firebase CLI

Install Firebase CLI following the [official guide](https://firebase.google.com/docs/cli#install_the_firebase_cli)

After installation, login to your Firebase account:

```bash
firebase login
```

#### FlutterFire CLI

Install FlutterFire CLI globally:

```bash
dart pub global activate flutterfire_cli
```

### 4. Configure Firebase

This project uses Firebase Firestore for data storage.

#### Setup Firebase project

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Cloud Firestore in your Firebase project
3. Set up Firestore security rules (see [Firestore Schema](#firestore-schema) section)

#### Configure FlutterFire for environments

The project supports two environments: **development** and **production**.

**macOS/Linux**:

```bash
bash flutterfire_config.sh <environment> <firebase-project-id>
```

**Windows**:

```powershell
.\flutterfire_config.ps1 <environment> <firebase-project-id>
```

Replace:

- `<environment>` with `dev` for development or `prod` for production
- `<firebase-project-id>` with your actual Firebase project ID

This will automatically configure Firebase for all platforms and create necessary configuration files.

### 5. Configure bundle identifiers (Optional)

If you want to use custom bundle identifiers:

#### Android

- Edit `android/app/build.gradle`
- Change the `applicationId` value
- Update package name in Firebase configuration

#### iOS & macOS

- Open `ios/Runner.xcworkspace` in Xcode
- Select `Runner` target
- Change the `Bundle Identifier` in the General tab
- Repeat for macOS in `macos/Runner.xcworkspace`

After changing bundle identifiers, re-run the FlutterFire configuration script.

### 6. Generate code

This project uses code generation for models and serialization:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Development

### Available Flavors

This project contains 2 flavors for different environments:

- **development**: For local development and testing
- **production**: For production releases

### Run in development mode

#### Using command line

```bash
# Development
flutter run --flavor development --target lib/main_development.dart

# Production
flutter run --flavor production --target lib/main_production.dart
```

### Run on specific platforms

```bash
# iOS
flutter run --flavor development --target lib/main_development.dart -d iPhone

# Android
flutter run --flavor development --target lib/main_development.dart -d android

# macOS
flutter run --flavor development --target lib/main_development.dart -d macOS

# Web
flutter run --flavor development --target lib/main_development.dart -d chrome

# Windows
flutter run --flavor development --target lib/main_development.dart -d windows
```

### Build for production

```bash
# iOS
flutter build ios --flavor production --target lib/main_production.dart

# Android (App Bundle)
flutter build appbundle --flavor production --target lib/main_production.dart

# Android (APK)
flutter build apk --flavor production --target lib/main_production.dart

# macOS
flutter build macos --flavor production --target lib/main_production.dart

# Web
flutter build web --target lib/main_production.dart

# Windows
flutter build windows --target lib/main_production.dart
```

## Project Structure

```
lib/
├── common/              # Common utilities and helpers
├── dependency/          # Dependency injection setup
├── model/              # Data models (Freezed)
├── navigator/          # Navigator 2.0 implementation
│   └── config/         # Navigation configuration
├── repository/         # Firebase repository layer
├── service/            # Business logic services
├── ui/                 # UI components
│   └── widgets/        # Reusable widgets
└── viewmodel/          # State management (Riverpod)
    ├── category/       # Category view models
    └── todo/           # Todo view models
assets/
├── images/             # Image assets
└── github_resources/   # Screenshots and demo files
```

## Features

### Task Management (CRUD Operations)

- **Create**: Add new todos with subject, category, and due date
- **Read**: View all todos, filter by category
- **Update**: Edit todo details, mark as completed
- **Delete**: Remove todos individually or by category
- **Categories**: Organize todos with emoji-based categories

### Responsive & Adaptive Design

- **Adaptive Layouts**: Optimized UI for different screen sizes
- **Cross-Platform**: Consistent experience across all platforms
- **Responsive Grids**: Dynamic layouts for mobile, tablet, and desktop
- **Platform-Specific UI**: Native look and feel on each platform

### Navigator 2.0

- **Custom Implementation**: Built from scratch without external packages
- **Deep Linking**: Support for URL-based navigation
- **State Restoration**: Preserve navigation state
- **Type-Safe Navigation**: Compile-time route validation

### Platform Support

- **Mobile**: iOS and Android
- **Desktop**: Windows, macOS
- **Web**: Chrome, Firefox, Safari, Edge

### UI/UX Features

- **Emoji Categories**: Fun, visual category organization
- **Swipe Actions**: Slidable todos for quick actions
- **Context Menus**: Right-click menus on desktop
- **Date Picker**: Easy date selection for due dates
- **Completion Status**: Visual feedback for completed tasks
- **Empty States**: Helpful messages when no data

## Firestore Schema

The app uses the following Firestore structure:

### Categories Collection

```
categories/
  ├── {categoryId}/
      ├── emoji: String        # Category emoji icon
      ├── name: String         # Category name
      └── todoSize: Number     # Number of todos in category
```

### Todos Collection

```
todos/
  ├── {todoId}/
      ├── categoryId: String      # Reference to category
      ├── finalDate: Number       # Due date (timestamp)
      ├── isCompleted: Boolean    # Completion status
      └── subject: String         # Todo description
```

### Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /categories/{categoryId} {
      allow read, write: if true; // Adjust based on your auth requirements
    }
    match /todos/{todoId} {
      allow read, write: if true; // Adjust based on your auth requirements
    }
  }
}
```

## Deep Linking

The app supports deep linking for direct navigation to specific todos.

### URL Format

```
crudtodoapp://crudtodoexample.com/categories/{categoryId}/todo/{todoId}
```

### Testing Deep Links

**iOS Simulator**:

```bash
xcrun simctl openurl booted crudtodoapp://crudtodoexample.com/categories/{categoryId}/todo/{todoId}
```

**Android Emulator/Device**:

```bash
adb shell am start -a android.intent.action.VIEW \
  -c android.intent.category.BROWSABLE \
  -d crudtodoapp://crudtodoexample.com/categories/{categoryId}/todo/{todoId}
```

Replace `{categoryId}` and `{todoId}` with actual IDs from your Firestore database.

### Configuring Deep Links

For detailed information on deep linking setup,
see [Flutter Deep Linking Guide](https://flutter.dev/docs/development/ui/navigation/deep-linking).

## Testing

### Run all tests

```bash
flutter test
```

### Run tests with coverage

The project includes scripts for running tests with coverage reporting:

#### macOS/Linux

First, install lcov:

```bash
# macOS (with Homebrew)
brew install lcov

# Linux
sudo apt -y install lcov
```

Run the coverage script:

```bash
bash test_coverage.sh
```

#### Windows

First, install lcov via Chocolatey:

```powershell
choco install lcov
```

If you get execution policy errors, run PowerShell as Administrator:

```powershell
Set-ExecutionPolicy RemoteSigned
```

Run the coverage script:

```powershell
.\test_coverage.ps1
```

### View coverage report

After running the coverage script, open `coverage/index.html` in your browser to view the detailed coverage report.

### Run specific test file

```bash
flutter test test/path/to/test_file.dart
```

## Code Quality

### Run code analysis

The project uses `very_good_analysis` to maintain code quality:

```bash
flutter analyze
```

### Format code

```bash
flutter format .
```

### Generate code

For Freezed models and JSON serialization:

```bash
# Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes and auto-generate
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Main Dependencies

### State Management & Architecture

- **hooks_riverpod**: State management and dependency injection
- **flutter_hooks**: React-like hooks for Flutter

### Firebase

- **firebase_core**: Firebase initialization
- **cloud_firestore**: Cloud Firestore database

### Navigation

- Custom Navigator 2.0 implementation (no external packages)

### Data Models

- **freezed**: Immutable data classes
- **freezed_annotation**: Annotations for Freezed
- **json_annotation**: JSON serialization annotations
- **equatable**: Value equality

### UI Components

- **google_fonts**: Google Fonts integration
- **flutter_slidable**: Swipeable list items
- **context_menus**: Context menus for desktop platforms
- **dart_emoji**: Emoji support

### Utilities

- **uuid**: UUID generation for Firestore documents
- **intl**: Date formatting and internationalization
- **window_size**: Desktop window management

### Dev Dependencies

- **build_runner**: Code generation
- **freezed**: Code generation for data classes
- **json_serializable**: JSON serialization
- **flutter_launcher_icons**: App icon generation
- **mocktail**: Mocking library for tests
- **remove_from_coverage**: Exclude generated files from coverage
- **very_good_analysis**: Strict lint rules
- **integration_test**: Integration testing support

## Navigator 2.0 Implementation

This project features a custom Navigator 2.0 implementation built from scratch:

### Key Components

- **RouterDelegate**: Manages app navigation state
- **RouteInformationParser**: Parses URLs to navigation state
- **Route Configuration**: Type-safe route definitions
- **Deep Linking**: URL-based navigation support

### Benefits

- **Type Safety**: Compile-time route validation
- **State Restoration**: Navigation state persists across app restarts
- **Deep Linking**: Direct navigation via URLs
- **No External Dependencies**: Full control over navigation logic

## Platform-Specific Features

### Desktop (Windows, macOS)

- Context menus (right-click support)
- Resizable windows
- Native window controls
- Keyboard shortcuts

### Mobile (iOS, Android)

- Swipe gestures for todo actions
- Platform-specific date pickers
- Native scroll physics
- Pull-to-refresh (where applicable)

### Web

- URL-based routing
- Browser back/forward support
- Responsive breakpoints
- Touch and mouse support

## Troubleshooting

### Error: "Flutter SDK not found"

Verify that Flutter is installed correctly and in your PATH:

```bash
flutter doctor
```

### Firebase configuration errors

Make sure you've run the FlutterFire configuration:

```bash
bash flutterfire_config.sh dev <your-firebase-project-id>
```

### Firestore permission errors

- Check your Firestore security rules
- Ensure your Firebase project is correctly configured
- Verify internet connection

### Code generation fails

Clean and regenerate:

```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Deep linking not working on iOS

- Verify URL schemes in `Info.plist`
- Check Associated Domains entitlement
- Ensure proper signing configuration

### Deep linking not working on Android

- Verify intent filters in `AndroidManifest.xml`
- Check app links configuration
- Test with proper URL format

### Flavor not found error

Make sure you're specifying both the flavor and target:

```bash
flutter run --flavor development --target lib/main_development.dart
```

### macOS build fails

```bash
flutter clean
cd macos
pod install
cd ..
flutter build macos --flavor development --target lib/main_development.dart
```

### Windows build fails

- Ensure Visual Studio 2019+ is installed
- Install Windows SDK
- Run as Administrator if needed

### Tests not finding coverage script

Ensure the script has execution permissions:

```bash
chmod +x test_coverage.sh
```

## Performance Optimization

This app implements several performance optimizations:

- **Firestore Indexing**: Optimized queries with proper indexes
- **Lazy Loading**: Data loaded on demand
- **Efficient State Management**: Riverpod's fine-grained reactivity
- **Cached Data**: Firestore offline persistence
- **Optimized Widgets**: Const constructors where possible
- **Platform Channels**: Efficient native integration

## Architecture

### State Management with Riverpod

- **Providers**: Global state and dependency injection
- **StateNotifiers**: Complex state management
- **Hooks**: Lifecycle management in widgets
- **Family**: Parameterized providers for dynamic data

### Data Flow

1. User interacts with UI
2. ViewModel receives action via Riverpod
3. Repository performs Firestore operation
4. Firestore updates data
5. Repository returns result
6. ViewModel updates state
7. UI rebuilds reactively

### Repository Pattern

- **Abstraction**: Repository abstracts Firestore operations
- **Testability**: Easy to mock for testing
- **Separation**: Clear separation of concerns
- **Reusability**: Shared repository logic

## Screenshots

### Android

![Android Demo](./assets/github_resources/android.gif)

### iOS

![iOS Demo](./assets/github_resources/ios.gif)

### macOS

![macOS Demo](./assets/github_resources/macos.gif)

### Web

![Web Demo](./assets/github_resources/web.gif)

### Windows

![Windows Demo](./assets/github_resources/windows.gif)

## Contributing

1. Create a branch from `main`
2. Make your changes
3. Run tests: `flutter test`
4. Run analysis: `flutter analyze`
5. Format code: `flutter format .`
6. Generate code if needed: `flutter pub run build_runner build --delete-conflicting-outputs`
7. Create a Pull Request to `main`

## Testing Strategy

### Unit Tests

- ViewModel state testing
- Repository method testing
- Model serialization testing
- Business logic validation

### Widget Tests

- Widget rendering tests
- User interaction tests
- Navigation testing
- State change verification

### Integration Tests

- End-to-end user flows
- Firestore integration
- Platform-specific features
- Deep linking scenarios

## Future Enhancements

Potential features for future versions:

- **User Authentication**: Firebase Auth integration
- **Subtasks**: Add subtasks to todos
- **Reminders**: Push notifications for due dates
- **Recurring Tasks**: Support for recurring todos
- **Labels/Tags**: Additional organization beyond categories
- **Search**: Full-text search for todos
- **Filters**: Advanced filtering options
- **Sorting**: Multiple sort criteria
- **Themes**: Light/dark mode support
- **Sync**: Cloud sync across devices
- **Offline Mode**: Enhanced offline capabilities
- **Export/Import**: Backup and restore functionality

## License

[Include license information here]
