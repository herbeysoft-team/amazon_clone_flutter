import 'package:amazon_clone_flutter/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings:  routeSettings,
        builder: (_) => const AuthScreen(),
      );
    default: 
        return MaterialPageRoute(
        settings:  routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("The Screen does not exist"),
          ),
        ),
      );
  }
}
