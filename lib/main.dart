import 'package:flutter/material.dart';
import 'package:b_sure/routes.dart';
import 'package:b_sure/screens/splash/splash_screen.dart';
import 'package:b_sure/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData.dark(),
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes);
  }
}
