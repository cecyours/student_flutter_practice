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

        // Model1 m = Model1.takeFromJson(json: SampleJson.json2);
      // print('value is : ${m.toJson()} ${m.country}');
// Model2 m = Model2.fromJson(json: SampleJson.sampleJson1);

  // print('value is ${m.menu.popUp.menuItems.first.onclick}');

  // print('value : ${m.toJson()}');

 // if(a is Data){
 //   a.x;
 // }else{
 //   a.name;
 // }

// Model4 v = Model4.fromJson(jsonMain: SampleJson.sampleJson3);
// print('value is ${v.dashBoard.title}');

  // Items items = Items.fromJson(json: SampleJson.sampleJson3['dashboard']['widgets'][1]['settings']['items'][0]);
  // Data data = Data.fromJson(json2: SampleJson.sampleJson3['dashboard']['widgets'][0]['settings']['data'][0]);

  // Setting setting = Setting.fromJson(json3: SampleJson.sampleJson3['dashboard']['widgets'][0]['settings']);
  // Data data = setting.d1[1] as Data;

  DashBoard dashBoard = DashBoard.fromJson(json5: SampleJson.sampleJson3['dashboard']);

  // Items items = dashBoard.widgets[1].setting.d1[0] as Items;

  // print('ok ${dashBoard.widgets[1].setting.d1}');

  print(dashBoard.widgets[1].setting.toJson());

  // for(abc a in dashBoard.widgets[1].setting.d1){
  //   // print('abc is ${a.toString()}');
  //   if(a is Items){
  //     Items items = a;
  //     print('${items.toJson()}');
  //   }else{
  //     Data data = a as Data;
  //     print('${data.toJson()}');
  //   }
  // }

  // print("value is ${items.toJson()}");

  // print('first item : ${data.x} ${data.y} ');
  // Model3 m = Model3.fromJson(json6: SampleJson.sampleJson2);
  //
  // print('value is: ${m.Emp1.emps.first.name}');
}
