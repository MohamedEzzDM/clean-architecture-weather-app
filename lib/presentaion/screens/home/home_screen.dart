import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/widgets/gap.dart';
import 'package:weather_app/data/repository/weather_repository.dart';


import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../../data/datasource/remote_data.source.dart';
import '../../../domain/entities/weather.dart';
import '../../../domain/usecases/get_weather_by_city_name.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Weather weather=Weather(11, "cityName", "main", "description", 0, 0, "03d");
  late String cityName;
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(

          child: Container(
            height: SizeConfig.screenHeight,
            padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                kBlueColor,
                kLightBlueColor,
              ],
            )),
            child: Column(

              children: [
                Gap(height: 150,),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: searchTextController,
                        cursorColor: kBlueColor,
                        decoration: InputDecoration(
                            hintText: "Enter the city name",
                            contentPadding: EdgeInsets.only(
                                left: getProportionateScreenWidth(20))),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: ElevatedButton(

                          onPressed: () {
                            cityName = searchTextController.text;
                            GetWeatherByCityName(WeatherRepository(DioRemoteDataSource()))..execute(cityName).then((value) {
                              weather = value;
                              setState(() {

                              });

                              });

                          },
                          child: Text("search"),
                        )),
                  ],
                ),
                Gap(height: 160,),
                Text(
                  "${weather.cityName}",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Image.network("http://openweathermap.org/img/wn/${weather.icon}@2x.png"),
                Text("${(( weather.temp - 273.15)).round()}°",//(( weather.temp - 273.15) * 9/5) + 32
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text("${weather.description}",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 18
                  ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
