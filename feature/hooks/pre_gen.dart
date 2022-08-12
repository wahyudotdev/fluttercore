import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final packageName = Directory.current.path.split('/').last;
  context.vars = {...context.vars, 'package_name': packageName};
}
