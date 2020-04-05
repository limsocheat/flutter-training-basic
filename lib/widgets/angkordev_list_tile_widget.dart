import 'package:flutter/material.dart';

// Declare Class Name
// Must be unique
class AngkorDevListTile extends StatelessWidget {
  // Variable / State
  // Final DataType ParameterName
  final IconData leadingIcon;
  final String title;
  final String subTitle;
  final IconData trailingIcon;
  final Function action;

  // Class Constructor
  // { optional parameter
  AngkorDevListTile({
    this.leadingIcon,
    this.title,
    this.subTitle,
    this.trailingIcon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(
            leadingIcon,
            color: Colors.red,
            size: 30,
          ),
          title: Text(title),
          subtitle: Text(subTitle),
          trailing: Icon(
            trailingIcon,
            color: Colors.green,
          ),
          onTap: action,
        ),
        Divider(),
      ],
    );
  }
}
