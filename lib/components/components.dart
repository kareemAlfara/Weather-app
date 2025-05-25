import 'package:flutter/material.dart';

Future<dynamic> navigat(context, {required Widget widget}) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
    Widget defulttext({
  TextDirection? textDirection,
  required String data,
  double? fSize,
  Color? color,
  FontWeight? fw,
}) =>
    Text(
      textDirection: textDirection,
      maxLines: 2,
      data,
      style: TextStyle(fontSize: fSize, color: color, fontWeight: fw).copyWith(
        overflow: TextOverflow.ellipsis,
      ),
    );