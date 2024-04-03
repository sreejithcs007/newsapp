import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasknews/presentation/categoryscreen/controller/categorycontroller.dart';
import 'package:tasknews/presentation/commonscreens/startingpage.dart';
import 'package:tasknews/presentation/favourite_screen/controller/favourite_screen_controller.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: [

          ChangeNotifierProvider(create: (context) => CategoryController()),
          ChangeNotifierProvider(create: (context) => FavouriteController()),

          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: StartingPage()),

      );

  }
}
