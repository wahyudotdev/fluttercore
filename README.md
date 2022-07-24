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
3. Open mason.yaml file then replace all content with below script
```
bricks:
  starter:
    git:
      url: git@github.com:wahyudotdev/fluttercore.git
      path: starter
```
4. Run mason get to download bricks from repository and then run mason make to autogenerate project starter. You will be prompted to enter screen size in UI design
```
mason get
mason make starter --on-conflict overwrite
```

5. Then you can run flutter pub get to download packages
```
flutter pub get
```

6. After that, use build runner to run code generator
```
flutter pub run build_runner watch --delete-conflicting-outputs
```

7. Your project is ready now, happy coding :)