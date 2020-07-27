import 'package:firstflutterapp/pages/choose_location.dart';
import 'package:firstflutterapp/pages/home.dart';
import 'package:firstflutterapp/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
