import 'package:event_bus/event_bus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();

  @singleton
  EventBus get eventBus => EventBus();
}
