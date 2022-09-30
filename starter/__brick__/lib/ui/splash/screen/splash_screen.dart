import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/im_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3), () => context.go('/menu'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ImFlutter(),
    );
  }
}
