import 'package:ecommerce_app_ui/models/recommendations_model.dart';
import 'package:ecommerce_app_ui/screens/home_screen.dart';
import 'package:ecommerce_app_ui/screens/item_screen.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/item':
        if (args is Recommendations) {
          return MaterialPageRoute(
            builder: (_) => ItemScreen(recommendations: args),
          );
        }
        return _error();
      default:
        return _error();
    }
  }

  //Error
  static Route<dynamic> _error() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('ERROR!'),
        ),
      ),
    );
  }
}
