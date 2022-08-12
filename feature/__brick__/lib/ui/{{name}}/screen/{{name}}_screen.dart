import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:{{package_name}}/di/injection.dart';

class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<{{name.pascalCase()}}Bloc>(),
      child: Scaffold(
        body: CustomScrollView(),
      ),
    );
  }
}