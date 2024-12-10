import 'package:flutter/cupertino.dart';
import 'package:maulesh_flutter_practice/topics/local_storage/sqflite/database_helper.dart';

import '../../topics/local_storage/sqflite/maulesh/database_helper_2.dart';
import 'database_helper.dart';
import 'dio_calling.dart';
import 'model.dart';

class GetData extends ChangeNotifier{

  FactModel? model;
  FactModel? modelToShow;
  CallingDio callingDio;
  DatabaseHelper4 databaseHelper2 = DatabaseHelper4();
  GetData({required this.callingDio});

  void getDataFromApi() async{
    try{
      model = await callingDio.getFactFromDio();
    }catch(e){
      print('something went wrong $e');
    }
  }

  void storeItLocally() async{
    if(model == null){
      print('pls get fact first you stupid manus');
      return;
    }

    await databaseHelper2.insertOrUpdateProduct(model!);
  }

  void showFromLocal()async{
   try{
     modelToShow = await databaseHelper2.getFacts();
     notifyListeners();
   }catch(e){
     print('dont have any fact stored locally you stupid manus');
   }

  }

}