import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'model.dart';

class CallingDioOrFirebase {
  Dio dio = Dio();
  FirebaseFirestore db = FirebaseFirestore.instance;


  Future<FactModel> getFactFromDio() async {
    try {
      final Response response = await dio.get('https://catfact.ninja/fact');

      if (response.statusCode == 200) {
        FactModel model = FactModel.fromJson(json: response.data);
        print('fact is ${model.fact}');
        print('length is ${model.factLength}');
        return model;
      } else {
        print('Something went wrong');
        throw Exception();
      }
    } catch (e) {
      print('error is $e');
      throw Exception();
    }
  }

  Future<FactModel> loadFact() async {
    try {
      final Response response = await dio.get('https://catfact.ninja/fact');

      if (response.statusCode == 200) {
        FactModel model = FactModel.fromJson(json: response.data);
        print('fact is ${model.fact}');
        print('length is ${model.factLength}');
        return model;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<bool> submitFact({required FactModel model})async{

    try{
      final user = <String, dynamic>{
        "fact":model.fact,
        "length":model.factLength
      };

      DocumentReference<Map<String, dynamic>> messageRef = db
          .collection("facts")
          .doc("fact doc"); // Generate a new document ID

      await messageRef.set(user);
      return true;
    }catch(e){
      print('Failed to add fact: $e');
      return false;
    }

  }

  Future<void> getFactFromFirebase() async {
    // try {
    //   final Response response = await dio.get('https://catfact.ninja/fact');
    //
    //   if (response.statusCode == 200) {
    //     FactModel model = FactModel.fromJson(json: response.data);
    //     print('fact is ${model.fact}');
    //     print('length is ${model.factLength}');
    //     return model;
    //   } else {
    //     print('Something went wrong');
    //     throw Exception();
    //   }
    // } catch (e) {
    //   print('error is $e');
    //   throw Exception();
    // }
  }

  Future<FactModel> loadFactFromFirebase() async {
    try {
      FactModel model;
      DocumentSnapshot<Map<String, dynamic>> data = await db
          .collection("facts")
          .doc("fact doc")
          .get();

      model = FactModel(fact: data.get('fact'), factLength: data.get('length'));

      print('data is ${model.fact} ${model.factLength}');
      return model;
    } catch (e) {
      print('error while reading data $e');
      throw Exception();
    }
  }

}
