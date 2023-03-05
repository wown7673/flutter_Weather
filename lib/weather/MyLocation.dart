
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';  // 위치정보 외부라이브러리


class MyLocation{

  double? latitude;
  double? longitude;

  // 위치정보 함수
  Future<void> getLocation() async {

    try {
      //https://pub.dev/packages/geolocator
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      print(position);
      // Latitude: 37.4219991, Longitude: -122.0840011 근데 이건 샌프란시스코본사임...
      // 내 위치를 지정해준후 결과는 => Latitude: 37.56484, Longitude: 126.9773017
      latitude = position.latitude;
      longitude = position.longitude;

    }catch(e){
      print('예외발생! : $e.toString()');
    }

  }

}

