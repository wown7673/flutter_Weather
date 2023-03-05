import 'package:flutter/material.dart';

import 'MyLocation.dart';
import 'package:test01/weather/Network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'WeatherMain.dart';



class Loding extends StatefulWidget {
  const Loding({Key? key}) : super(key: key);

  @override
  State<Loding> createState() => _LodingState();
}

class _LodingState extends State<Loding> {
  @override
  void initState() {
    super.initState();
    weatherFromLocation();
  }

  void weatherFromLocation() async {
    // position객체에서 위도와 경도를 분리하기위해
    double? latitude2;
    double? longitude2;


    // 위치정보
    MyLocation location = MyLocation();
    await location.getLocation();
    latitude2 = location.latitude;
    longitude2 = location.longitude;

    // 날씨정보
    // 3.0버전은 무료라도 일단 지불카드 등록해야되서 하위버전 2.5로 바꿈.... 이건 무료는 그냥 사용가능
    //String part = 'current';
    // units=metric 파라미터는 화씨,섭씨등을 설정( https://openweathermap.org/api/one-call-3#data )
    const String APIKEY = 'b56aea882e5d420ccb654bdf3d358e15';
    //String url = 'https://api.openweathermap.org/data/3.0/onecall?lat=$latitude2&lon=$longitude2&exclude=$part&appid=$APIkey';

    // 날씨정보api call
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$APIKEY&units=metric';


    // 대기오염api call
    String url2 = 'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude2&lon=$longitude2&appid=$APIKEY';


    Network data = Network(url, url2);
    dynamic myJson = await data.getWeatherData();
    dynamic myJson2 = await data.getAirData();

    if (context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherMain(weatherData : myJson, airData : myJson2);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80,

        ),
      ),
    );

        }
}
