import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../controller/homePageController.dart';

class WeatherDetailPage extends GetView<HomePageController> {
  const WeatherDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index1 = Get.arguments["index1"];
    final index2 = Get.arguments["index2"];
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Weather Detail Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            weatherDetailListTileWidget(
              "Datetime",
              controller.weatherDetailList[index1].hours![index2].datetime
                  .toString(),
            ),
            weatherDetailListTileWidget(
                "Temp",
                ((controller.weatherDetailList[index1].hours![index2].temp -
                                32) *
                            5 /
                            9)
                        .toString()
                        .split(".")
                        .first +
                    "°c"),
            weatherDetailListTileWidget(
              "feelslike",
              controller.weatherDetailList[index1].hours![index2].feelslike
                  .toString(),
            ),
            weatherDetailListTileWidget(
              "humidity",
              controller.weatherDetailList[index1].hours![index2].humidity
                  .toString(),
            ),
            weatherDetailListTileWidget(
              "dew",
              controller.weatherDetailList[index1].hours![index2].dew
                  .toString(),
            ),
            weatherDetailListTileWidget(
              "windgust",
              controller.weatherDetailList[index1].hours![index2].windgust
                  .toString(),
            ),
            weatherDetailListTileWidget(
              "windspeed",
              controller.weatherDetailList[index1].hours![index2].windspeed
                  .toString(),
            ),
            weatherDetailListTileWidget(
              "winddir",
              controller.weatherDetailList[index1].hours![index2].winddir
                  .toString(),
            ),
            weatherDetailListTileWidget(
              "pressure",
              controller.weatherDetailList[index1].hours![index2].pressure
                  .toString(),
            ),
            weatherDetailListTileWidget(
              "cloudcover",
              controller.weatherDetailList[index1].hours![index2].cloudcover
                  .toString(),
            ),
          ],
        ),
      ),
    );
  }

  weatherDetailListTileWidget(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
