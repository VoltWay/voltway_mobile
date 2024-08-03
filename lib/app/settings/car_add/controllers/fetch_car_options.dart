import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<List<Map<String, dynamic>>> getCarOptions() async {
  final dio = Dio();

  try {
    final response = await dio.get("http://127.0.0.1:3000/api/v1/cars.json");
    final List cars = response.data['cars'];

    // Convert each car JSON object to a Map<String, dynamic>
    final carOptions =
        cars.map((car) => Map<String, dynamic>.from(car)).toList();
    print(carOptions);
    return carOptions;
  } catch (e) {
    print("Error: $e");
    return [];
  }
}

Future<List<Map<String, dynamic>>> getMarker() async {
  final dio = Dio();

  try {
    final response = await dio.get(
        "http://127.0.0.1:3000/api/v1/processing/e_charging_stations.json");
    final List cars = response.data;

    // Convert each car JSON object to a Map<String, dynamic>
    final carOptions =
        cars.map((car) => Map<String, dynamic>.from(car)).toList();
    return carOptions;
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
