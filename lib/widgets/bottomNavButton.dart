import 'package:Plants/utils/colors.dart';
import 'package:Plants/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavButton extends StatelessWidget {
  final String title;
  final bool enabled;
  BottomNavButton(this.title, this.enabled);

  @override
  Widget build(BuildContext context) {
    var fontSize = ScreenUtil().setSp(20);
    return FlatButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.05),
      color: enabled ?  white : primaryColor,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize * 1.2,
          color: enabled ? primaryColor : white
        ),
      ),
    );
  }
}
