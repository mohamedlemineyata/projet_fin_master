
import 'package:flutter/material.dart';
import 'package:test1/routers/home.dart';
main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute : '/',
        routes : {
          '/' : (context) => Home(),
        },
        //home: Home()



      );


  }


}