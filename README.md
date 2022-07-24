# FlutterCore Project Starter
### This project starter will generate something like this

### Usage
1. Install mason_cli
```
dart pub global activate mason_cli
```
2. Create flutter project and init mason inside project root
```
flutter create test_template
cd test_template
mason init
```
3. Open mason.yaml file then copy this and save
```
# Register bricks which can be consumed via the Mason CLI.
# https://github.com/felangel/mason
bricks:
  starter:
    git:
      url: git@github.com:wahyudotdev/fluttercore.git
      path: starter
```
4. Run mason get to download bricks from repository and then run mason make to autogenerate project starter
```
mason get
mason make starter
```

5. After that you are required to enter flutter project name, in this case i will enter test_template as project name. Press 'Y' if prompted to overwrite existing file

6. Then you can run flutter pub get to download packages
```
flutter pub get
```

7. After that, use build runner to run code generator as this example is already configured with code generator and already include an example model classes with JsonSerializable
```
flutter pub run build_runner watch --delete-conflicting-outputs
```

8. Your project is ready now, happy coding :)