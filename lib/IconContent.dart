import 'package:flutter/material.dart';

import 'consts.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContent({this.icon,this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 10.0,),
        Text(label,
        style: labelTextStyle,
        ),
      ],
    );
  }
}