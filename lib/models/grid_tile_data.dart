import 'package:flutter/widgets.dart';

class GridTileData{
  String title;
  IconData icon;
  Color backgroundColor;
  Widget navigationPage;

  GridTileData( {required this.title,
  required this.icon,
  required this.backgroundColor,
  required this.navigationPage});
}