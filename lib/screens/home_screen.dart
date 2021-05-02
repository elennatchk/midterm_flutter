import 'package:flutter/material.dart';
import 'package:midterm/data/models/dummy_data.dart';
import 'package:midterm/data/models/car_model.dart';
import 'package:midterm/data/repository/car_helper.dart';
import 'package:midterm/screens/edit_car.dart';
import 'package:midterm/screens/car_details_screen.dart';
import 'package:midterm/widgets/main_list_item.dart';
import 'add_new_car.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<Car> carList = DUMMY_DATA;



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var movie = carList[index];
          return Dismissible(
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.blue,
              child: Icon(
                Icons.delete,
                color: Colors. purple,
              ),
            ),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                carDetailsScreen.routeName,
                arguments: movie,
              ),
              onLongPress: () {
                Navigator.pushNamed(
                  context,
                  EditCar.routeName,
                  arguments: {"car": movie, "index": index},
                ).then((_) {
                  setState(() {});
                });
              },
              child: MainListItem(
                imageUrl: movie.imageUrl,
                model: movie.model,
                year: movie.year.toString(),
               ),
            ),
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Are you sure?"),
                content: Text("Do you really want to delete this Car Info?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("NO"),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          CarRepo().removeCar(movie.id);
                          Navigator.pop(context);
                        });
                      },
                      child: Text("YES"))
                ],
              ),
            ),
          );
        },
        itemCount: carList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AddNewCarScreen.routeName).then((_) {
          setState(() {});
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}
