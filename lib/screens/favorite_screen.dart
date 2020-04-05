import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favourite page'),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('Favourite Page'),
          ),
        ),
      ),
    );
  }
}
