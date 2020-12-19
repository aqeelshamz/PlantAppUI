import 'package:Plants/utils/colors.dart';
import 'package:Plants/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Subtitle extends StatelessWidget {
  final String title;
  Subtitle(this.title);

  @override
  Widget build(BuildContext context) {
    var fontSize = ScreenUtil().setSp(20);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize  *1.2,
          fontWeight: FontWeight.bold,
          color: black.withOpacity(0.6),
        ),
      ),
    );
  }
}
