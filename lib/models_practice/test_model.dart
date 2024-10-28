import 'json_sample.dart';
import 'model.dart';

void main() {
  // Model m = Model.fromJson(json: SampleJson.json1);
  // Model j = Model.fromJson(json: SampleJson.json1);
  // Model n = Model.fromJson(json: SampleJson.json1);


  // Model1 m = Model1(name: SampleJson.json2['name'], age: SampleJson.json2['age'],
  //     std: SampleJson.json2['std'],
  //     street_Address: SampleJson.json2['street Address'],
  //     state: SampleJson.json2['state'],
  //     country: SampleJson.json2['country']);

        Model1 m = Model1.takeFromJson(json: SampleJson.json2);
      print('value is : ${m.toJson()} ${m.country}');


  // print('value : ${m.toJson()}');
}
