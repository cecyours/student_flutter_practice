import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreQueries {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> applyQuery() async{
    db.collection("cities").where("population", isEqualTo : 550000).get().then(
          (querySnapshot) {
        print("Successfully completed ${querySnapshot.docs[0].data()['population']}");
        for (var docSnapshot in querySnapshot.docs) {

          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  void setData() async {

    final cities = db.collection('users');

    String email = 'pavan@gmail.com';
    String password = 'password';

    Map<String, dynamic> auth = {
      "email": email,
      "password": password
    };
    try {
      print('data is ');
      await cities.doc().set(auth);
    } catch (e) {
      print('error is $e');
    }
    print("data added");
  }

// for (int i = 1; i <= 50; i++) {
//   final data = <String, dynamic>{
//     "name": "City $i",
//     "state": "State $i",
//     "country": "Country $i",
//     "capital": i % 10 == 0, // Mark every 10th city as a capital
//     "population": 500000 + (i * 1000), // Vary population
//     "regions": ["region_$i", "common_region"],
//   };
//
//
//
//   try{
//     print('data is ');
//     await cities.doc("City_$i").set(data);
//   }catch(e){
//     print('error is $e');
//   }
//   print("City $i added");
// }
  }

  Future<int> getTwo() async{
   return 2;
  }

