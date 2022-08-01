# FlutterCore : Project Starter

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
3. Add this starter bricks to your codebase
```
mason add starter --git-url git@github.com:wahyudotdev/fluttercore.git --git-path starter
```
4. Run mason get to download bricks from repository and then run mason make to autogenerate project starter. You will be prompted to input screen size in UI design
```
mason get
mason make starter --on-conflict overwrite
```
5. Your project is ready now, happy coding :)