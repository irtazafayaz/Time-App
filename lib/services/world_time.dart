import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String time;
  String flag;
  String url;
  String location;
  bool isDayTime;


  WorldTime({this.flag, this.url, this.location});

  Future<void> getData() async {

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //print('$datetime - $offset');

      DateTime dateTime = DateTime.parse(datetime);
      dateTime = dateTime.add(Duration(hours: int.parse(offset)));
      isDayTime = dateTime.hour > 6 && dateTime.hour < 20 ? true : false ;
      time = DateFormat.jm().format(dateTime);

    }
    catch (e){
      print('error agai - $e');
      time = 'Couldnt hit the url';

    }




    //print(dateTime);
    //print(time);
  }
}
