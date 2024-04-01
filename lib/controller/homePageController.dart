import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:weatherapps/model/wheatherModel.dart';
import 'package:weatherapps/utils/loaders.dart';

class HomePageController extends GetxController {
  RxString city = "".obs;
  RxString country = "".obs;
  RxString resolveAddress = "".obs;
  RxString temp = "".obs;
  RxString environment = "".obs;
  RxString windSpeed = "".obs;
  RxString cloud = "".obs;

  RxList<WheaterDetailByDateModel> weatherDetailList =
      <WheaterDetailByDateModel>[].obs;

  Dio dio = Dio();

  Future getWeatherData() async {
    try {
      final response = await dio.get(
        "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/${city.value},${country.value}?key=5BERNBB4FDVYM7XM4NGERGEC7",
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint("Something went wrong");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  getWeatherDetail() async {
    try {
      showloadingIndicators();
      weatherDetailList.clear();
      await getWeatherData().then((value) async {
        // print(value);
        resolveAddress.value = value["resolvedAddress"];
        temp.value =
            ((value["currentConditions"]["temp"] - 32) * 5 / 9).toString();

        environment.value = value["currentConditions"]["conditions"];
        windSpeed.value = value["currentConditions"]["windspeed"].toString();
        cloud.value = value["currentConditions"]["cloudcover"].toString();

        weatherDetailList.value = (value["days"] as List)
            .map((e) => WheaterDetailByDateModel.fromJson(e))
            .toList();
        print("weather detal list");
        print(weatherDetailList);

        // print(resolveAddress.value);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    hideLoading();
  }
}
