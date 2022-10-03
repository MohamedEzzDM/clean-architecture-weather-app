import 'package:weather_app/data/datasource/remote_data.source.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repository/base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseRemoteDataSource dataSource;

  WeatherRepository(this.dataSource);
  @override
  Future<Weather> getWeatherByCityName(String cityName) {
    return dataSource.getWeatherByCityName(cityName);
  }

  @override
  Future<Weather> getWeatherById(int id) {
    // TODO: implement getWeatherById
    throw UnimplementedError();
  }
}
