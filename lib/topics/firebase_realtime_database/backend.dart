import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeDb{
  DatabaseReference ref = FirebaseDatabase.instance.ref('users');

  void setData({required String name}) async{
    await ref.set({
      // "name": name,
      // "age": 18,
      // "address": {
      //   "line1": "100 Mountain View"
      // }
    });
  }

  void update() async{
    await ref.update({
      "age": 40,
    });
  }



}
