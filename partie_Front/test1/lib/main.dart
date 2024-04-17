import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:test1/example/example_controller.dart';
import 'package:test1/example/example_view.dart';
import 'package:test1/routers/home.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
        ),
        GetPage(
          name: ExampleView.routeName,
          page: () => const ExampleView(),
          binding: BindingsBuilder.put(
            () => ExampleController(),
          ),
        ),
      ],
      //home: Home()
    );
  }
}
