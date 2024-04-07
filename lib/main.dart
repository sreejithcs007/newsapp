import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tasknews/presentation/categoryscreen/controller/categorycontroller.dart';
import 'package:tasknews/presentation/commonscreens/startingpage.dart';
import 'package:tasknews/presentation/favourite_screen/controller/favourite_screen_controller.dart';
import 'package:tasknews/repository/favourite/model/favouritemodel.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavouriteAdapter());
  var box = await Hive.openBox('favourite');

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
