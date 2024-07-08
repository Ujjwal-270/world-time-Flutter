import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'New Delhi', flag: 'ind.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'New York', flag: 'us.png', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'kr.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Berlin', flag: 'ger.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Sydney', flag: 'aus.png', url: 'Australia/Sydney'),
    WorldTime(
        location: 'Cape Town', flag: 'sa.png', url: 'Africa/Johannesburg'),
    WorldTime(
        location: 'Los Angeles', flag: 'us.png', url: 'America/Los_Angeles'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Loaction'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child:ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8), // Adjust the border radius as per your design
                    child: Image.asset('assets/${locations[index].flag}',
                      width: 50, // Adjust the width of the rectangular avatar
                      height: 40, // Adjust the height of the rectangular avatar
                      fit: BoxFit.cover, // Ensure the image covers the entire rectangular area
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}