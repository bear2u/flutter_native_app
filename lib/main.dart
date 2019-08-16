import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  __HomeState createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  static const platform = const MethodChannel('flutter.native/helper');
  String response = "";


  onPressed() async {
    try {
      final String result = await  platform.invokeMethod('helloFromNativeCode');
      response = result;
      setState(() {

      });
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(response),
            RaisedButton(
              child: Text('get native'),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}



