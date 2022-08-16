import 'package:firebase_database/firebase_database.dart';
import 'data.dart';

class DataDao {
  final DatabaseReference _dataRef =
      FirebaseDatabase.instance.ref().child('mistakes');

  void saveData(Data data) {
    _dataRef.push().set(data.toJson());
  }

  Query getDataQuery() {
    return _dataRef;
  }
}
