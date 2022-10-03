# Networking

Before we deep dive into networking, you must familiarize yourself with build_runner and dependency injection because this starter heavily use build_runner for code generation.

Example Case:

Request :
- GET https://example-api.com/api/user/1

Response :
- Json :
```json
{
    "message":"success",
    "data": {
        "id":1, 
        "name":"dash"
    }
}
```

1. Open command line and run build_runner in watch mode
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

2. Open core/config/config.dart and set BASE_URL to https://example-api.com/api
```dart
class Config {
  static const baseUrl = 'https://example-api.com/api';
}
```

3. Create generic class to handle common response pattern.

```dart
// core/data/model/api_response.dart
import 'package:json_annotation/json_annotation.dart';
part '../../../gen/core/data/model/api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final T? data;

  ApiResponse({this.message, this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) =>
      _$ApiResponseToJson(this, toJsonT);
}


```

4. Create model class and annotate it with JsonSerializable to parse json data. And don't forget to extend Equatable for value equality

```dart
// core/data/model/user.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part '../../../gen/core/data/model/user.g.dart';

@JsonSerializable
class User extends Equatable {

    @JsonKey(name: 'id')
    final int? id;

    @JsonKey(name: 'name')
    final String? name;

    const User({this.id, this.name});

    @override
    List<Object?> get props => [id, name];

}
```

5. Create abstract class to automatically generate network implementation class.

```dart
// core/data/networking/user_api.dart

@RestApi() // auto generate implementation class with retrofit library
@Injectable() // inject required dependency
abstract class UserApi {

    // factoryMethod annotation is mandatory when creating an instance with factory
    // Dio instance will automatically injected through factory
    @factoryMethod
    factory UserApi(Dio dio) = _UserApi;

    // get user with path param
    @GET('/user/{id}')
    Future<ApiResponse<User?>> getUserWithId({
        @Path('id') String? id
    });

    // get user with query param
    @GET('/user/{id}')
    Future<ApiResponse<User?>> getUserWithIdQuery({
        @Query('id') String? id
    });
    
    // example post request with form data
    @POST('/user/register/')
    @FormUrlEncoded()
    Future<ApiResponse<User?>> register({
        @Field('name') String? name,
        @Field('email') String? email,
        @FIeld('password') String? password,   
    });
}

```

6. And finally you can get data from network like this :
```dart

void fetchUser() async {
    UserApi api = getIt<UserApi>();
    try {
        final response = await api.getUserWithId({id: '1'});
        print(response?.data); // Instance of User
    }catch(e) {
        print(e);
    }
}

```
You can read retrofit documentation [here](https://pub.dev/packages/retrofit)