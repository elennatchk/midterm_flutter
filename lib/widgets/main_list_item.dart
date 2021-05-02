import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String model;
  final String year;


  MainListItem({
    required this.imageUrl,
    required this.model,
    required this.year,
   });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/car_placeholder.png"),
                image: NetworkImage(imageUrl),
              ),
            ),
            Text(model),
            Text(year),
          ],
        ),
      ),
    );
  }
}
