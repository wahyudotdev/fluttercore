import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('execute flutter pub get');
  Process.run('flutter', ['pub', 'get']).then((value) {
    final err = value.stderr;
    if (err is String && err.isNotEmpty) {
      throw err;
    }
    context.logger.info('result : ${value.stdout}');
    context.logger.info(
        'execute: flutter pub run build_runner build --delete-conflicting-outputs');
    Process.run('flutter', [
      'pub',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs'
    ]).then((value) {
      final err = value.stderr;
      if (err is String && err.isEmpty) {
        context.logger.info('result : ${value.stdout}');
        context.logger.info('your starter is ready, happy coding :)');
      } else {
        throw value.stderr;
      }
    });
  });
}
