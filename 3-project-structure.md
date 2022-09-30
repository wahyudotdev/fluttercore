# Project Structure

```
.
├── android
├── ios
├── assets
│   └── images
│   └── l10n
│   └── maps
├── lib
│   ├── base_app.dart
│   ├── core
│   │   ├── config
│   │   └── data
│   │   │   └── models
│   │   │   └── datasource
│   │   │   └── repository
│   │   ├── utils
│   │   └── widgets
│   ├── di
│   │   ├── app_modules.dart
│   │   ├── injection.config.dart
│   │   ├── injection.dart
│   │   └── network_modules.dart
│   ├── gen
│   │   ├── assets.gen.dart
│   │   └── core
│   ├── main.dart
│   └── ui
│       ├── router.dart
│       ├── login
│       |   └── bloc
│       |   └── screen
│       |   └── widget
│       └── register
│           └── bloc
│           └── screen
│           └── widget
├── build.yaml
├── l10n.yaml
└── pubspec.yaml
```

### Assets
This is where you place your images or another resources. This starter already enable type safe assets generator. Run it with
```
flutter pub run build_runner watch --delete-conflicting-outputs 
```
Example if you have ic_copy.png inside assets/images/ic_copy.png then you can acces your image inside codebase with
```dart
import 'package:your_app_package/gen/assets.gen.dart'

Container(
    child: Assets.images.icCopy.image()
);
```

### base_app.dart
use this as top level initialization for global state like user auth. Or in rare case like example if you must implement an overlay global dialog to handle error, you can wrap the entire flutter widget with this class and call dialog inside base_app from anywhere with state manager

### Config
this directory consist of several config that you must configure yourself, like initial api key (if any), base url, and network timeout.

### Models
save your data models inside this directory

### Datasource
Usually contains api service class and local cache

### Repository
Save your repository class inside this folder

### Utils
Include several utility class like additional json converter annotation, image picker class, etc.

### Widgets (global)
Global custom common widget for your app, like button, dropdown, textfield, etc

### Gen
This folder will be created automagically when you run build runner. Just ignore it

### router.dart
Contain routes of your app, using gorouter as its primary navigation library. You can learn gorouter from [gorouter.dev]('https://gorouter.dev/')

### Features
Each app features (ex: login, register) will always consist of screen folder to store screen layout, widget folder to store screen widgets, and bloc folder to store your bloc class