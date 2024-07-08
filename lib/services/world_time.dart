import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  String location;//location name for the UI
  String? time;// time in that location
  String flag; //Url to asset flag
  String url;//location url for api endpoint
  late bool isDayTime;//true or false if daytime or not
  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async {

    try
    {
      Response response= await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map Data=jsonDecode(response.body);
      //print(Data);

      //get properties from data
      String datetime= Data['utc_datetime'];
      String offset=Data['utc_offset'];
      //print(datetime);
      //print(offset);
      String plusOrMinus=offset.substring(0,1);
      //Create datetime object
      DateTime now=DateTime.parse(datetime);
      if(plusOrMinus=='-'){
        now=now.subtract(Duration( hours:int.parse(offset.substring(1,3)),minutes:int.parse(offset.substring(4,6))));
      }
      else
        {
          now=now.add(Duration( hours:int.parse(offset.substring(1,3)),minutes:int.parse(offset.substring(4,6))));
        }
      //print(now);
      //set time property
      isDayTime= now.hour>6 && now.hour<19?true:false;
      time=DateFormat.jm().format(now);
      //print(time);
    }
    catch(e){
      print('caught error : $e');
    }
  }
}
