import 'package:flutter/material.dart';
import 'package:midterm/screens/edit_car.dart';
import 'package:midterm/screens/add_new_car.dart';
import 'package:midterm/screens/car_details_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        accentColor: Colors.deepOrange,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
          )
        )

      ),
      home: HomeScreen(),
      routes: {
        carDetailsScreen.routeName: (ctx) => carDetailsScreen(),
        AddNewCarScreen.routeName: (ctx) => AddNewCarScreen(),
        EditCar.routeName: (ctx) => EditCar(),
      },
    );
  }
}

