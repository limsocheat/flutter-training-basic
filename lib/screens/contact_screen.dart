import 'package:angkordev/widgets/global_drawer_widget.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Text('099993483'),
              Text('limsocheat111@gmail.com'),
            ],
          ),
        ),
      ),
      endDrawer: GlobalDrawerWidget(),
    );
  }
}
