import 'package:Plants/utils/colors.dart';
import 'package:Plants/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';

class PlantDetails extends StatelessWidget {
  final String title;
  final String description;
  final String size;
  final String year;
  final String price;
  final String image;
  final String heroSuffix;

  PlantDetails(this.title, this.description, this.size, this.year, this.price,
      this.image, this.heroSuffix);

  @override
  Widget build(BuildContext context) {
    var fontSize = ScreenUtil().setSp(20);
    return Scaffold(
      backgroundColor: white,
      body: Container(
        height: height,
        width: width,
        color: primaryColor,
        child: SafeArea(
          child: Stack(
            children: [
              bottomSheet(title, description, price, fontSize),
              plantImage(image, heroSuffix),
              top(year, size, fontSize),
            ],
          ),
        ),
      ),
    );
  }
}

Widget plantImage(String image, String heroSuffix) {
  return Positioned(
    bottom: height * 0.4,
    right: -width * 0.2,
    child: Hero(
      tag: image + heroSuffix,
      child: Image.asset(image),
    ),
  );
}

Widget top(String year, String size, double fontSize) {
  return Positioned(
    top: height * 0.04,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                FeatherIcons.arrowLeft,
                color: white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "size",
                  style: TextStyle(color: white, fontSize: fontSize * 1.4),
                ),
                Text(
                  size,
                  style: TextStyle(
                    color: white,
                    fontSize: fontSize * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "Years",
                  style: TextStyle(color: white, fontSize: fontSize * 1.4),
                ),
                Text(
                  "$year Years",
                  style: TextStyle(
                    color: white,
                    fontSize: fontSize * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget bottomSheet(
    String title, String description, String price, double fontSize) {
  return Positioned(
    bottom: 0,
    left: 0,
    child: Container(
      padding: EdgeInsets.only(
        top: height * 0.06,
        left: width * 0.08,
        right: width * 0.08,
      ),
      height: height * 0.45,
      width: width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius * 1.5),
          topRight: Radius.circular(borderRadius * 1.5),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: fontSize * 2,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: fontSize * 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: fontSize * 1.4,
                    height: height * 0.0014,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.2,
                child: FlatButton(
                  splashColor: primaryColor.withOpacity(0.2),
                  highlightColor: primaryColor.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  color: grey.withOpacity(0.1),
                  child: Icon(FeatherIcons.heart, color: primaryColor),
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(color: white, fontSize: fontSize * 1.5),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.04,
          ),
        ],
      ),
    ),
  );
}
