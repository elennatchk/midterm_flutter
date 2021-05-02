import 'package:flutter/material.dart';
 import '../data/models/car_model.dart';

class carDetailsScreen extends StatelessWidget {
  static const routeName = "/details-screen";

  @override
  Widget build(BuildContext context) {
    final Car car = ModalRoute.of(context)!.settings.arguments as Car;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Center(
            child: Column(
              children: [
                Image.network(car.imageUrl),
                Text(car.brand),
                Text(car.model),
                Text(car.year.toString()),
                Text(car.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
