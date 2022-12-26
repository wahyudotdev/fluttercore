import 'dart:io';

import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

void run(HookContext context) {
  pubspecWriter(context);
  createColorSwatches(context);
}

void createColorSwatches(HookContext context) {
  final colorVal = context.vars['primary_color'] as String;
  final r = int.parse((colorVal[2] + colorVal[3]), radix: 16);
  final g = int.parse((colorVal[4] + colorVal[5]), radix: 16);
  final b = int.parse((colorVal[6] + colorVal[7]), radix: 16);

  for (var i = 0; i < 10; i++) {
    final newR = (r + ((255 - r) * (0.1 * i))).toInt().toRadixString(16);
    final newG = (g + ((255 - g) * (0.1 * i))).toInt().toRadixString(16);
    final newB = (b + ((255 - b) * (0.1 * i))).toInt().toRadixString(16);
    context.vars = {...context.vars, 'swatches_$i': '0xff$newR$newG$newB'};
    context.logger.info(context.vars.toString());
  }
}

void pubspecWriter(HookContext context) {
  var pubspecStr = File('pubspec.yaml').readAsStringSync();
  var pubspec = loadYaml(pubspecStr) as YamlMap;

  // Get package name from pubspec.yaml
  context.vars = {...context.vars, 'package_name': pubspec['name']};

  // ============ dependencies ====================
  var oldDeps = pubspec['dependencies'] as YamlMap;
  var newDeps = Map.of(oldDeps.value);
  newDeps.addEntries({
    MapEntry('flutter_localizations', {'sdk': 'flutter'}),
    MapEntry('json_annotation', '^4.5.0'),
    MapEntry('equatable', '^2.0.3'),
    MapEntry('retrofit', '^3.0.1+1'),
    MapEntry('injectable', '^1.5.3'),
    MapEntry('get_it', '^7.2.0'),
    MapEntry('dartz', '^0.10.1'),
    MapEntry('dio', '^4.0.6'),
    MapEntry('google_fonts', '^3.0.1'),
    MapEntry('dio_logging_interceptor', '^1.0.1'),
    MapEntry('flutter_secure_storage', '^5.0.2'),
    MapEntry('event_bus', '^2.0.0'),
    MapEntry('flutter_bloc', '^8.1.1'),
    MapEntry('path_provider', '^2.0.11'),
    MapEntry('infinite_scroll_pagination', '^3.2.0'),
    MapEntry('rxdart', '^0.27.5'),
    MapEntry('bloc_concurrency', '^0.2.0'),
    MapEntry('image_picker', '^0.8.5+3'),
    MapEntry('permission_handler', '^10.0.0'),
    MapEntry('flutter_image_compress', '^1.1.0'),
    MapEntry('uuid', '^3.0.6'),
    MapEntry('flutter_local_notifications', '^9.7.0'),
    MapEntry('flutter_screenutil', '^5.5.3+2'),
    MapEntry('go_router', '^4.2.7'),
    MapEntry('copy_with_extension', '^4.0.0'),
  });

  // ============ dev-dependencies ===============
  var oldDevDeps = pubspec['dev_dependencies'] as YamlMap;
  var newDevDeps = Map.of(oldDevDeps.value);
  newDevDeps.addEntries({
    MapEntry('build_runner', ''),
    MapEntry('json_serializable', ''),
    MapEntry('retrofit_generator', ''),
    MapEntry('injectable_generator', ''),
    MapEntry('flutter_gen_runner', ''),
    MapEntry('copy_with_extension_gen', '^4.0.0')
  });

  // =========== flutter ===================

  var oldFlutter = pubspec['flutter'] as YamlMap;
  var newFlutter = Map.of(oldFlutter.value);
  newFlutter.addEntries({
    MapEntry('generate', true),
    MapEntry('assets', ['assets/images/', 'assets/maps/'])
  });

  var newPubspec = Map.of(pubspec);

  newPubspec['dependencies'] = newDeps;
  newPubspec['dev_dependencies'] = newDevDeps;
  newPubspec['flutter'] = newFlutter;

  var newStrPubspec = YAMLWriter(allowUnquotedStrings: true).write(newPubspec);

  print(newStrPubspec);

  File('pubspec.yaml').writeAsStringSync(newStrPubspec);
}
