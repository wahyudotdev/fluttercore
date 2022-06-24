import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'core/utils/screen.dart';
import 'di/injection.dart';

class BaseApp extends StatefulWidget {
  final Widget? child;

  const BaseApp({Key? key, this.child}) : super(key: key);

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  @override
  Widget build(BuildContext context) {
    Screen().init(context);
    getIt<EventBus>().on().listen((event) {
      if (kDebugMode) {
        print(event);
      }
    });

    return Stack(
      children: [
        widget.child!,
      ],
    );
  }
}
