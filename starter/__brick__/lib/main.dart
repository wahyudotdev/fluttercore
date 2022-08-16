import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tes/core/utils/self_sign_cert.dart';
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
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  if (kDebugMode) {
    HttpOverrides.global = SelfSignCert();
  }
  HydratedBlocOverrides.runZoned(
    () => runApp(const App()),
    storage: storage,
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size({{width}}, {{height}}),
      builder: (context, child) {
        final theme = AppTheme();
        return MaterialApp(
          title: '{{package_name}}',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: theme.textTheme,
            radioTheme: theme.radioTheme,
            checkboxTheme: theme.checkBoxTheme,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: theme.appBarTheme,
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          onGenerateRoute: AppRoutes.generateRoute,
          supportedLocales: const [Locale('id')],
          builder: (context, widget) => BaseApp(child: widget),
        );
      },
    );
  }
}
