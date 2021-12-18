import 'package:ecommerce_app_ui/routes.dart';
import 'package:ecommerce_app_ui/screens/home_screen.dart';
import 'package:ecommerce_app_ui/widgets/home/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      initialRoute: '/',
      onGenerateRoute: RoutesGenerator.generateRoute,
      home: Scaffold(
        extendBody: true,
        body: Stack(
          children: const [
            HomeScreen(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNav(),
            ),
          ],
        ),
      ),
    );
  }
}
