import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';

import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     bodyText1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
        RegistrationScreen.routeName: (context) => RegistrationScreen(),
        WelcomeScreen.routeName: (context) => WelcomeScreen()
      },
    );
  }
}
