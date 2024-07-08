import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};


  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty?data:ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    //set background
    String bgImage=data['isDayTime']?'mrn.png':'night.png';
    Color bgColor = data['isDayTime']?Colors.blue:Colors.black;
    Color textColor = data['isDayTime'] ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0),
              child: Column(
                children: <Widget>[
                ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result=await Navigator.pushNamed(context, '/location');
                      setState((){
                        data={
                          'time':result['time'],
                          'isDayTime':result['isDayTime'],
                          'location':result['location'],
                          'flag':result['flag']
                        };
                      });
                    },

                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Use a transparent background color.
                  onPrimary: data['isDayTime'] ? Colors.black : Colors.white,
                  elevation: 0.0, // Set the elevation to 0 for a flat appearance.
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Increase the padding for touch targets.
                ),
              ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: data['isDayTime'] ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontFamily: 'digital',
                      fontSize: 90.0,
                      color: Colors.green[700],
                    )
                  )
              ],
        ),
            ),
          ),
        ),
    );
  }
}
