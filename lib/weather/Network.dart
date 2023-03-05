import 'package:http/http.dart' as http;  // 외부패키지라서 가독성위해 한번더 http라고 붙혀줌. 사용할때도 http라고 붙혀줘야함
import 'dart:convert'; // 파싱위해


class Network{

  final String url;
  final String url2;

  Network(this.url, this.url2);

  // 날씨정보
  Future<dynamic> getWeatherData() async{
    var myJson;

    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      String jsonData = response.body;

      myJson = jsonDecode(jsonData);
      print(myJson);

    }else{
      print('예외발생 : ${response.statusCode}');
    }
    return myJson;
  }

  // 공기정보
  Future<dynamic> getAirData() async{

    var myJson;

    http.Response response = await http.get(Uri.parse(url2));

    if(response.statusCode == 200){
      String jsonData = response.body;

      myJson = jsonDecode(jsonData);
      print(myJson);
    }else{
      print('예외발생 : ${response.statusCode}');
    }
    return myJson;
  }
}