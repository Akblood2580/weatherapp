import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/homePageController.dart';
import 'weatherDetailPage.dart';

class WeatherPage extends GetView<HomePageController> {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Weather Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(13.w),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.resolveAddress.value,
              style: TextStyle(fontSize: 33.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              controller.environment.value,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/clouds.png",
                    height: 90,
                  ),
                  Text(
                    controller.temp.value.split(".").first + "°c",
                    style:
                        TextStyle(fontSize: 55.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                weatherDetailWidget(
                    "${controller.windSpeed.value}km/h", "assets/wind.png"),
                weatherDetailWidget(
                    "${controller.temp.value.split(".").first}%",
                    "assets/clouds.png"),
                weatherDetailWidget(
                    "${controller.cloud.value}%", "assets/water-drop.png")
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              child: ListView.builder(
                itemBuilder: (context, index1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weather Date: ${controller.weatherDetailList[index1].datetime}",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 165.h,
                        width: Get.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(WeatherDetailPage(), arguments: {
                                  "index1": index1,
                                  "index2": index
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(4.w),
                                height: 150.h,
                                width: 130.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      controller.weatherDetailList[index1]
                                          .hours![index].datetime!,
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    Image.asset(
                                      "assets/clouds.png",
                                      height: 50,
                                    ),
                                    Text(
                                      ((controller.weatherDetailList[index1]
                                                          .hours![index].temp -
                                                      32) *
                                                  5 /
                                                  9)
                                              .toString()
                                              .split(".")
                                              .first +
                                          " °c",
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          shrinkWrap: true,
                          itemCount: controller
                              .weatherDetailList[index1].hours!.length,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  );
                },
                itemCount: controller.weatherDetailList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    );
  }

  weatherDetailWidget(String text, String img) {
    return Container(
      margin: EdgeInsets.all(4.w),
      height: 140.h,
      width: 110.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            img,
            height: 50,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
