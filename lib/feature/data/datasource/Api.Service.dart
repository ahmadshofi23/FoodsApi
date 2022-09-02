import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:testmobileptsinarmas/feature/data/models/foods.mode.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = "https://www.themealdb.com/api/json/v1/1/categories.php";

  Future<Foods> fetchFoodList() async {
    try {
      Response response = await _dio.get(_url);
      log(response.data.toString());
      return Foods.fromJson(response.data);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
