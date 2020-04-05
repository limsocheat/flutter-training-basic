import 'package:angkordev/widgets/global_drawer_widget.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Screen'),
      ),
      body: Container(
        child: Center(
          child: Text('About Screen'),
        ),
      ),
      drawer: GlobalDrawerWidget(),
    );
  }
}
