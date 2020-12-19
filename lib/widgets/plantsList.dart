import 'dart:convert';

import 'package:Plants/screens/plantDetails.dart';
import 'package:Plants/utils/colors.dart';
import 'package:Plants/utils/constants.dart';
import 'package:Plants/utils/plantJson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

List<dynamic> plantList = jsonDecode(plantJSON);

class PlantsList extends StatelessWidget {
  final String heroSuffix;
  PlantsList(this.heroSuffix);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(
        width * 0.05,
      ),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: plantList.length,
      itemBuilder: (context, index) {
        return buildPlantContainer(index, heroSuffix);
      },
    );
  }
}

Widget buildPlantContainer(int index, String heroSuffix) {
  return Padding(
    padding: EdgeInsets.only(right: width * 0.04),
    child: Stack(children: [
      top(index, heroSuffix),
      bottom(index)
    ]),
  );
}

Widget top(int index, String heroSuffix) {
  return GestureDetector(
    onTap: () {
      Get.to(PlantDetails(
          plantList[index]['title'],
          plantList[index]['description'],
          plantList[index]['size'],
          plantList[index]['years'],
          plantList[index]['price'],
          plantList[index]['image'],
          heroSuffix));
    },
    child: Container(
      padding: EdgeInsets.only(bottom: height * 0.05),
      height: double.infinity,
      width: width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: grey.withOpacity(0.08),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              color: grey.withOpacity(0.08),
              blurRadius: 10,
              spreadRadius: 5)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Hero(
          tag: plantList[index]['image'] + heroSuffix,
          child: Image.asset(
            plantList[index]['image'],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    ),
  );
}

Widget bottom(int index) {
  var fontSize = ScreenUtil().setSp(20);
  return Positioned(
    bottom: 0,
    left: 0,
    child: Container(
      width: width * 0.45,
      height: height * 0.08,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.04, top: height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plantList[index]['title'],
              style: TextStyle(
                  fontSize: fontSize * 1.5, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.004,
            ),
            Text(
              plantList[index]['type'],
              style: TextStyle(
                  fontSize: fontSize * 0.9,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
