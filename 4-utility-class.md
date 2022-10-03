# Utility

## DateTime extension
Convert DateTime object to formatted String. Usage
```dart
import 'core/utils/datetime_extension.dart'

final dateTime = DateTime.now();
final formattedDate = dateTime.dateFormat('dd-MM-yyyy');
print(formattedDate); // 30-09-2022
```

List of common Datetime pattern. For example if DateTime.now() = 30 Sep 2022 15:19:20
| Pattern   | Outputs     |
| ----------- | ----------- |
| yyyy | 2022
| MM | 09
| dd | 30
| HH | 15
| mm | 19
| ss | 20
| MMM | Sep
| EEE | Fri
| dd-MM-yyyy | 30-09-2022
| dd MMM yyyy | 30 Sep 2022
| EEE, dd MMM yyyy | Fri, 30 Sep 2022
You can browse the full pattern list from [here]('https://api.flutter.dev/flutter/intl/DateFormat-class.html')

## Int to IDR formatter

Usage :
```dart
int price = 100000;
print(price.toIDR); // Rp. 100 000,-
```

## Json Custom Parser
JsonSerializable is not able to convert data when the type is not match. Like example when we try to parse this data
```json
{"price":"10000"}
```
and we have data model like this
```dart
import 'package:json_annotation/json_annotation.dart';
part '../../../gen/core/data/model/product.g.dart';

@JsonSerializable
class Product {
    
    @JsonKey(name: 'price')
    final int price;

    const User({required this.price});

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
```

It will crash on runtime because the json data of price is string, not int. So we will use custom parser that we implements from JsonConverter class and add that custom parser to Product class

Use this class as annotation in your models. Example :
```dart
import 'package:json_annotation/json_annotation.dart';
import 'package:package_name/core/utils/json_custom_parser.dart'; // 1. Add this import
part '../../../gen/core/data/model/product.g.dart';

@JsonSerializable
@JsonStringToInt // 2. Add this custom annotation
class Product {
    
    @JsonKey(name: 'price')
    final int price;

    const User({required this.price});

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

```
Here is list of available custom parser :
#### - JsonStringToInt
Parse potential nullable string to int, without this it will crash whenever we try to parse data like this {"price":"10000"}. When failed to parse data then it will return 0
#### - JsonStringToIntNullable
Same as JsonStringToInt but it will return null instead of 0 when parse failed
#### - JsonStringToDouble
Parse potential nullable string to double. Return 0 if data is null
#### - JsonStringToDoubleNullable
Same as JsonStringToDoubleNullable but it will return null instead of 0 when parse failed
#### - JsonIntToBool
Parse 1 as true and 0 as false

## Media Service
Use this class to pick image from camera or gallery.
Example usage :
```dart
// get MediaService instance from service locator
final mediaService = getIt<MediaService>();

AppButton(
    onClick: ()  {
        // method getImage return Future<File?>
        // AppImageSource.gallery -> open gallery to pick image
        // AppImageSource.camera -> open camera to pick image
        mediaService.getImage(context, AppImageSource.gallery)
                    .then((file) => print(file));
    }
)
```

## Bloc Transformer

This starter is already include [bloc_concurrency](https://pub.dev/packages/bloc_concurrency) library that consist of 4 default transformer :
- concurrent : process event concurrently
- sequential : process event sequentially
- droppable : ignore any event added while an event is processing
- restartable : process only latest event and cancel previous event handler

Bonus :
- debounceSequential : delay process of any event. Usefull to delay user input like search feature

Example usage :
```dart
import 'package:name/core/utils/bloc_transformer.dart';

class SearchProduct extends Bloc<SearchEvent, SearchState> {
    SearchProduct() : super(SearchInitial()) {

        on<KeywordEnteredEvent>((event, emit) {
            debugPrint(event.searchKeyword);
        }, transformer: debounceSequential(const Duration(seconds: 1))); // delay user input for 1 sec
    
    }
}
```

## Let Callback
Execute callback when value is not null. Usefull checking null value. Example usage :

```dart
import 'package:name/core/utils/let.dart';

void main(){
    String name?
    name?.let((it) => print(it)); // won't execute

    name = 'flutter';

    name?.let((it) => print(it)); // flutter
}
```

## Password Strength
Find the password strength of given String. 
- PasswordStrength.weak : <8 character
- PasswordStrength.medium : >= 8 character with number
- PasswordStrength.strong : >= 8 character with number and uppercase letter
- PasswordStrength.veryStrong : >= 8 character with number, uppercase, and special symbol

Example usage :
```dart
import 'package:name/core/utils/password_helper.dart';

String? newPassword = 'P@ssw0rd';

print(newPassword.passwordStrength); // PasswordStrength.veryStrong

```

## Self Sign Cert
Bypass network error when there is invalid https certificate. **Use this for debugging purpose only** because it can risk our user to MITM attack, for example when we need to debug or intercept http request with third party tools like burpsuite or postman. Example usage :
```dart
import 'package:flutter/foundation.dart';
import 'core/utils/self_sign_cert.dart';

void main() {
    if (kDebugMode) {
        HttpOverrides.global = SelfSignCert();
    }
}
```

## Email Validator
Check if email is valid. Example usage
```dart
import 'package:name/core/utils/string_extension.dart';

String? email = 'flutter.dev';
print(email.isValidEmail); // false

email = 'cs@flutter.dev';
print(email.isValidEmail); // true

```

