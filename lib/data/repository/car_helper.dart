import 'package:midterm/data/models/dummy_data.dart';
import 'package:midterm/data/models/car_model.dart';

import '../models/car_model.dart';

class CarRepo {
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }


  void removeCar(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [car]);
  }
}