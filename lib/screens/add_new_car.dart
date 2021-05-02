import 'package:flutter/material.dart';
import 'package:midterm/data/models/car_model.dart';
import 'package:midterm/data/repository/car_helper.dart';

class AddNewCarScreen extends StatelessWidget {
  static const routeName = "/add-new-car";

  final _formKey = GlobalKey<FormState>();
  TextEditingController carDescription = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController carReleaseYear = TextEditingController();
  TextEditingController carID = TextEditingController();
  TextEditingController carName = TextEditingController();
  TextEditingController carUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    decoration: InputDecoration(hintText: "Please enter Brand"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid brand";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: model,
                    decoration: InputDecoration(hintText: "Please enter Model"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid model";
                      }
                      return null;
                    },
                  ),
                ),


                Card(
                  child: TextFormField(
                    controller: carReleaseYear,
                    decoration:
                    InputDecoration(hintText: "Please enter release Year"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid releaseyear";
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
                          Car car = Car(imageUrl: carUrl.text,
                              id: int.parse(carID.text),
                              brand: carName.text,
                              model: model.text,
                              year: int.parse(carReleaseYear.text),
                              description: carDescription.text);
                          CarRepo().addCar(car);
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