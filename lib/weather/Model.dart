import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

class Model{

  // 날씨 아이콘
  Widget? getWeatherIcon(int condition){

    Widget? result;

    // 이부분은 대충함... 상세히 나눌것
    if(condition<300){
      result = SvgPicture.asset('assets/svg/climacon-cloud_lightning.svg', color: Colors.black87);
    }else if(condition<400){
      result = SvgPicture.asset('assets/svg/climacon-cloud_rain.svg', color: Colors.black87);
    }else{
      result = SvgPicture.asset('assets/svg/climacon-sun.svg');
    }
    return result;
  }

  // 대기질 아이콘
  Map<String,Widget>? getAirWidget(int airCondition){

    Map<String,Widget>? result;
    Widget? airText;
    Widget? airIcon;

    switch(airCondition){
      case 1 :
        airText = Text(
            '매우좋음',
            style: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.bold
            ));
        airIcon = Image.asset('assets/emotion/good.png', width: 35, height: 35,);
        break;

      case 2 :
        airText = Text(
            '깨끗함',
            style: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.bold
            ));
        airIcon = Image.asset('assets/emotion/fair.png' ,width: 35, height: 35,);
        break;

      case 3 :
        airText = Text(
            '보통',
            style: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.bold
            ));
        airIcon = Image.asset('assets/emotion/moderate.png', width: 35, height: 35,);
        break;

      case 4 :
        airText = Text(
            '나쁨',
            style: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.bold
            ));
        airIcon = Image.asset('assets/emotion/poor.png', width: 35, height: 35,);
        break;

      case 5 :
        airText = Text(
            '매우나쁨',
            style: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.bold
            ));
        airIcon = Image.asset('assets/emotion/poor.png' ,width: 35, height: 35,);
        break;
    }


    result = {'airText': airText!  , 'airIcon' : airIcon! };

    return result;
  }


}