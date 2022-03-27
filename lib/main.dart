// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:breaking_bad/routers/app_routers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    BreakingBadApp(
      appRouter: AppRouter(),
    ),
  );
}

class BreakingBadApp extends StatelessWidget {
  final AppRouter appRouter;

  BreakingBadApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 18, 43, 20),
        primaryColorDark: const Color.fromARGB(255, 12, 26, 13),
        primaryColorLight: Colors.green[100],
      ),
    );
  }
}
