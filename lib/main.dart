import 'package:flutter/material.dart';
import 'event_selection_screen.dart';
import 'event_details_screen.dart';
import 'login_screen.dart';
import 'themes.dart';
import 'bio_setup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/bioSetup': (context) => BioSetupScreen(),
        '/eventSelection': (context) => EventSelectionScreen(),
        '/eventDetails': (context) => EventDetailsScreen(),
      },
    );
  }
}
