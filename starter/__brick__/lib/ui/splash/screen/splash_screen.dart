import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/utils/translation.dart';
import '../widget/im_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.helloMom)
      ),
      body: const ImFlutter(),
    );
  }
}
