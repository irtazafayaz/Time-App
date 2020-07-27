import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map map = {};

  @override
  Widget build(BuildContext context) {
    map = map.isEmpty ? ModalRoute.of(context).settings.arguments : map ;
    print(map);

    String bgImage = map['dayTime'] ? 'day.png' : 'night.png';
    Color backColor = map['dayTime'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic value = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      map = {
                        'location': value['location'],
                        'flag': value['flag'],
                        'time': value['time'],
                        'dayTime': value['dayTime'],
                      };
                    });

                    },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    map['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.grey[300],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                map['time'],
                style: TextStyle(
                  fontSize: 80.0,
                  color: Colors.grey[300],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
