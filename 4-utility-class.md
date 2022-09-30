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