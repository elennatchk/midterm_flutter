import 'package:flutter/material.dart';
import 'package:midterm/data/models/car_model.dart';
import 'package:midterm/data/repository/car_helper.dart';

class EditCar extends StatefulWidget {
  static const routeName = "/edit-car";

  @override
  _EditCarScreenState createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCar> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController carID;
  late TextEditingController carName;
  late TextEditingController model;
  late TextEditingController carDescription;
  late TextEditingController carReleaseDate;
   late TextEditingController carUrl;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Car car = parsedData["car"];
    final int index = parsedData["index"];
    carID = TextEditingController(text: car.id.toString());
    carName = TextEditingController(text: car.model);
    carDescription = TextEditingController(text: car.description);
     carReleaseDate = TextEditingController(text: car.year.toString());
     carUrl = TextEditingController(text: car.imageUrl);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: carID,
                    decoration: InputDecoration(hintText: "Please enter id"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid id";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carName,
                    decoration: InputDecoration(hintText: "Please enter title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid title";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carUrl,
                    decoration: InputDecoration(hintText: "Please enter url"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid url";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carDescription,
                    decoration:
                        InputDecoration(hintText: "Please enter description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid description";
                      }
                      return null;
                    },
                  ),
                ),

                Card(
                  child: TextFormField(
                    controller: carReleaseDate,
                    decoration:
                        InputDecoration(hintText: "Please enter release date"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid release date";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Car movie = Car(
                              imageUrl: carUrl.text,
                              id: int.parse(carID.text),
                              brand: carName.text,
                              model: model.text,
                              year: int.parse(carReleaseDate.text),
                              description: carDescription.text)
                          ;
                          CarRepo().editCar(movie, index);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Add"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
