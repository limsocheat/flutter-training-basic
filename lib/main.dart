import 'package:angkordev/screens/post_screen.dart';
import 'package:flutter/material.dart';

// Initial function to startup
void main() => runApp(
      // to start flutter app
      // Class name to initial startup of runApp,
      // must be Stateless or Stateful Widget
      AngkorDev(),
    );

// Declare class name by extending StatelessWidget from material.dart package
class AngkorDev extends StatelessWidget {
  // To build visual layout
  @override
  Widget build(BuildContext context) {
    // must be returned MaterialApp widget for initial Widget
    // in application, there is only one MaterialApp ever ever existed.......
    return MaterialApp(
      // to manage app theme (color, font, theme)
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 14,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          subtitle: TextStyle(
            color: Colors.black54,
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),

      // the first loaded widget on AppStart
      // Scaffold to display visual layout structure appBar, body, drawer,
      // bottomSheet, FAB
      home: PostScreen(), //where application show in the first loaded
    );
  }
}
