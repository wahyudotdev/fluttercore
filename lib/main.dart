import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttercore/core/config/config.dart';
import 'core/utils/self_sign_cert.dart';
import 'core/widgets/app_theme.dart';

import 'base_app.dart';

import 'di/injection.dart';
import 'ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.dev);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  if (kDebugMode) {
    HttpOverrides.global = SelfSignCert();
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(Config.screenWidth, Config.screenHeight),
      builder: (context, child) {
        final theme = AppTheme();
        return MaterialApp.router(
          title: 'fluttercore',
          debugShowCheckedModeBanner: false,
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: ThemeMode.light,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('id')],
          builder: (context, widget) => BaseApp(child: widget),
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
        );
      },
    );
  }
}
