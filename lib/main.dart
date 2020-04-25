import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

// Initial function to startup
void main() => runApp(
      // to start flutter app
      // Class name to initial startup of runApp,
      // must be Stateless or Stateful Widget
      AngkorDev(),
    );

// Declare class name by extending StatelessWidget from material.dart package
class AngkorDev extends StatefulWidget {
  // To build visual layout
  @override
  _AngkorDevState createState() => _AngkorDevState();
}

class _AngkorDevState extends State<AngkorDev> {
  // Declare connectivity status
  bool _connectivityStatus = true;
  // Declare connectivity
  final Connectivity _connectivity = Connectivity();
  // Declare connectivity stream (to continue listen to connectivity)
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        setState(() {
          _connectivityStatus = true;
        });
      } else if (result == ConnectivityResult.wifi) {
        setState(() {
          _connectivityStatus = true;
        });
      } else if (result == ConnectivityResult.none) {
        setState(() {
          _connectivityStatus = false;
        });
      } else {
        setState(() {
          _connectivityStatus = false;
        });
      }

      print(_connectivityStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    // must be returned MaterialApp widget for initial Widget
    // in application, there is only one MaterialApp ever ever existed.......
    return MaterialApp(
      builder: (context, screen) => Scaffold(
        appBar: _connectivityStatus
            ? null
            : PreferredSize(
                preferredSize: Size.fromHeight(25),
                child: AppBar(
                  titleSpacing: 0,
                  title: Container(
                    padding: EdgeInsets.all(0),
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.signal_cellular_connected_no_internet_4_bar,
                          size: 12,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Offline',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
        body: screen,
      ),
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
      home: HomeScreen(), //where application show in the first loaded
    );
  }
}
