import 'package:dio/dio.dart';
import 'package:maulesh_flutter_practice/practice/dio_sqflite_provider/model.dart';

class CallingDio {
  Dio dio = Dio();

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
}
