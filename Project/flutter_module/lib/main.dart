import 'package:flutter/material.dart';
import 'package:flutter_module/pages/home_screen.dart';
import 'package:flutter_module/pages/info_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(
              title: 'Flutter module into Android',
            ),
        '/info': (context) => const InfoScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
