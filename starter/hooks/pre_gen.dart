import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final packageName = Directory.current.path.split('/').last;
  context.vars = {...context.vars, 'package_name': packageName};
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
