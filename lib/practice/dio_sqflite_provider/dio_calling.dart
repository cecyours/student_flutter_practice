import 'package:dio/dio.dart';
import 'package:maulesh_flutter_practice/practice/dio_sqflite_provider/model.dart';

class CallingDio {
  Dio dio = Dio();

  void getFactFromDio() async {
    try {
      final Response response = await dio.get('https://catfact.ninja/fact');

      if (response.statusCode == 200) {
        FactModel model = FactModel.fromJson(json: response.data);
        print('fact is ${model.fact}');
        print('length is ${model.factLength}');
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print('error is $e');
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
}
