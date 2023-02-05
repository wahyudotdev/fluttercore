import 'package:flutter/foundation.dart';

class Config {
  static const baseUrl = 'https://629867c8de3d7eea3c664c1a.mockapi.io';
  static const apiKey = 'API_KEY';
  static const notificationChannelId = 'fluttercore_channel_id';
  static const notificationChannelName = 'fluttercore notification';
  static const notificationChannelDesc = 'fluttercore notification';
  static const savedNotification = 'FCM_MESSAGE';
  static const timeout = kDebugMode ? 90 * 1000 : 10 * 1000;
  static const screenWidth = 390.0;
  static const screenHeight = 800.0;
}
