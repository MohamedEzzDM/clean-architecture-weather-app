import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/data/models/weather_model.dart';

abstract class BaseRemoteDataSource{
  
  Future<WeatherModel> getWeatherByCityName(String cityName);
}

class DioRemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {

    Response response = await Dio().get("$baseUrl/weather?q=$cityName&appid=$apiKey");
    return WeatherModel.fromJson(response.data);
    
  }
  
}
// https://api.openweathermap.org/data/2.5/weather?q=egypt&appid=f5bc07036f9282aa97e1f65238853dca