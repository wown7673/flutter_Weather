import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart'; // svg파일 읽기

import 'package:google_fonts/google_fonts.dart';

import 'package:timer_builder/timer_builder.dart';

import 'package:intl/intl.dart';  // 날짜포멧

import 'Model.dart';

class WeatherMain extends StatefulWidget {
  final dynamic weatherData;
  final dynamic airData;

  const WeatherMain({this.weatherData, this.airData});

  @override
  State<WeatherMain> createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {

  // 현재시간
  var date = DateTime.now();

  // weather모델
  Model model = Model();

  //////// 날씨 정보 ////////////
  // 도시
  String? cityName;
  // 온도
  int? temp;

  // 날씨 아이콘
  Widget? weathericon;
  // 날씨 설명
  String? description;



  ////// 대기 정보 //////
  Map<String, Widget>? airWidgetMap;
  // 대기질 지수 아이콘
  late Widget? airIcon;
  // 대기질 지수 상태
  late Widget? airText;

  // 미세먼지
  double? dust1;  // 미세먼지
  double? dust2;  // 초미세먼지


  @override
  void initState() {
    super.initState();

    // 중요!!!!
    // 이렇게 사용가능이유가 extends State<WeatherMain> 부분때문임
    // State 클래스 : https://api.flutter.dev/flutter/widgets/State-class.html
    // State클래스는 widget이라는 속성을 가지고있음 https://api.flutter.dev/flutter/widgets/State/widget.html
    // 이 widget속성은 A State object's configuration is the corresponding StatefulWidget instance.
    // 즉, widget이라는 속성은 State 개체의 구성은 해당하는 StatefulWidget 인스턴스입니다.
    // 즉, widget이라는 속성이 해당 StatefulWidget의 인스턴스 라는 소리
    // 그래서 아래와 같이 접근가능
    // WeatherMain widget .....
    //print(widget.weatherData);

    updateData(widget.weatherData, widget.airData);

  }

  void updateData(dynamic weatherData, dynamic airData) {
    ///// 날씨 정보 /////
    // 도시명
    cityName = weatherData['name'];

    // 기온
    double temp2 = weatherData['main']['temp'];
    temp = temp2.toInt(); // toInt() 해도되고, round()함수(return int형임)로 반올림해도됨

    // 날씨아이콘
    int weatherId = weatherData['weather'][0]['id'];
    weathericon = model.getWeatherIcon(weatherId);

    // 날씨설명
    description = weatherData['weather'][0]['description'];


    ///// 대기정보 //////
    // 대기질지수 아이콘
    // 대기질지수 상태
    int weatherAqi = airData['list'][0]['main']['aqi'];
    airWidgetMap = model.getAirWidget(weatherAqi);

    airText = airWidgetMap!['airText'];
    airIcon = airWidgetMap!['airIcon'];



    // 미세먼지
    dust1 = airData['list'][0]['components']['pm2_5'];  // 초미세먼지
    dust2 = airData['list'][0]['components']['pm10'];   // 미세먼지

  }

  // 시간
  String getSysTime() {
    var now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 바디가 app 바까지 차지하도록하는 작업
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.near_me, size: 30),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching, size: 30),
            onPressed: () {},
          ),
        ],

        // 바디가 app 바까지 차지하도록하는 작업
        backgroundColor: Colors.transparent, // 투명
        elevation: 0.0,
      ),
      // Stack위젯은 무언가를 차곡차곡 쌓아올린다는뜻...
      body: Stack(
        children: [
          Image.asset(
            'assets/background/background.jpg',
            // 바디를 app바까지 차지하면 옮긴거라서 빈공간이 생김 그래서
            // 아래 3 작업을 해줘야 공간전체를 다씀
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(20),
            // 굳이 이 컬럼이 필요할까... 뭐 코딩셰프말로는 플러터레이아웃은 자기 하고싶은대로라는데...
            // 그래도 하나 전체 깜싸는 컬럼이라고 생각하자
            child: Column(
              // 도화지 전체를 골고루 이용하기위해!!( 맨밑이 화면 젤 아래로감 )
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 지역과, 시간날짜를 감싸는 column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 150),
                      Text(
                        '$cityName',
                        /*style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 3)*/
                        style: GoogleFonts.lato(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),

                      //시간, 날짜
                      Row(
                        children: [

                          // Duration은 1분단위로 시간을 표시
                          TimerBuilder.periodic(
                            Duration(minutes: 1),
                            builder: (context) {
                              print('${getSysTime()}');

                              //builder의 리턴형은 Widget임..
                              return Text(
                                '${getSysTime()}',
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          Text(
                            DateFormat(' - EEEE, ').format(date),
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM, yyy').format(date),
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // 온도와 날씨 를 감싸는 column
                SizedBox(height: 150),

                // 온도, 구름상태
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$temp\u2103',
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 0)),
                    Row(
                      children: [
                        // 날씨 아이콘 : https://openweathermap.org/weather-conditions#How-to-get-icon-URL
                        // 그러나 위 공식 사이트 제공하는 아이콘은 세련되지않아 svg로 따로 해줌
                        //model.getWeatherIcon(200), // 이렇게 하지말고 아래처럼할것... ui그리는곳은 단순하게!
                        weathericon!,
                        SizedBox(
                          width: 10,
                        ),
                        Text('$description',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0))
                      ],
                    ),
                  ],
                ),

                Divider(height: 10, thickness: 2, color: Colors.white30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 첫번째
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Text('AQI 대기질지수',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0)),
                        SizedBox(height: 10),
                        airIcon!,
                        SizedBox(height: 10),
                        airText!,

                      ],
                    ),
                    // 두번째
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('미세먼지',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0)),
                        SizedBox(height: 10),
                        SizedBox( // 첫번째 아이콘이랑 높이 같게해주기위해
                          height: 35,
                          child: Center(
                            child: Text('$dust1', style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,

                              fontWeight: FontWeight.normal,
                            ),),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'μg/m3',
                          style: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)
                        )
                      ],
                    ),
                    // 세번째
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('초미세먼지',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0)),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 35,
                          child: Center(
                            child: Text('$dust2', style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'μg/m3',
                          style: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white )
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
