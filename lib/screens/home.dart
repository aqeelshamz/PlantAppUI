import 'package:Plants/utils/colors.dart';
import 'package:Plants/utils/constants.dart';
import 'package:Plants/widgets/bottomNavButton.dart';
import 'package:Plants/widgets/plantsList.dart';
import 'package:Plants/widgets/subTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fontSize = ScreenUtil().setSp(20);

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              color: primaryColor,
            ),
            Container(
              color: white,
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: fontSize * 2,
                                  fontWeight: FontWeight.bold,
                                  color: black.withOpacity(0.8)),
                            ),
                            Row(
                              children: [
                                Material(
                                  color: white,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(FeatherIcons.search),
                                  ),
                                ),
                                Material(
                                  color: white,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(FeatherIcons.grid),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: height * 0.02),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Subtitle("BEST SELLING"),
                          Container(
                            height: height * 0.4,
                            child: PlantsList("bestSelling"),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Subtitle("NEW PLANTS"),
                          Container(
                            height: height * 0.35,
                            child: PlantsList("newPlants"),
                          ),
                          SizedBox(
                            height: height * 0.1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: height * 0.08,
                width: width,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(borderRadius),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavButton("Home", true),
                    BottomNavButton("Indoor", false),
                    BottomNavButton("Outdoor", false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
