import 'package:flutter/material.dart';


class AuthIcon extends StatelessWidget {
  IconData icon;
  Color color;
  double size;

  AuthIcon({
    Key? key,
    required this.icon,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}