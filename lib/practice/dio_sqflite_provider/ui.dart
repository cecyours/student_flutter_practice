import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/practice/dio_sqflite_provider/model.dart';
import 'package:maulesh_flutter_practice/practice/dio_sqflite_provider/provider.dart';
import 'package:provider/provider.dart';

import 'dio_calling.dart';

class Goodui extends StatefulWidget {
  const Goodui({super.key});

  @override
  State<Goodui> createState() => _gooduiState();
}

class _gooduiState extends State<Goodui> {
  FactModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<GetData>(
        builder: (BuildContext context, GetData provider, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(onPressed: () {
                provider.getDataFromApi();
              }, child: Text("Get Data From Api")),
              FilledButton(
                  onPressed: () {
                    provider.storeItLocally();
                  }, child: Text("Store Data In Sql Lite")),
              FilledButton(
                  onPressed: () {
                    provider.showFromLocal();
                  }, child: Text("Fetch Data From Sql Lite")),
              FilledButton(
                  onPressed: () {
                    DirectLoadDataFromApi();
                  },
                  child: Text("Direct Load Data From Api")),
              SizedBox(
                height: 20,
              ),
              Text(model == null ? 'its null' : model!.fact),
              Text(model == null ? 'its null' : model!.factLength.toString()),
              SizedBox(
                height: 20,
              ),
              Text('local data'),
              SizedBox(
                height: 10,
              ),
              Text(provider.modelToShow == null
                  ? 'its null'
                  : provider.modelToShow!.fact),
              Text(provider.modelToShow == null
                  ? 'its null'
                  : provider.modelToShow!.factLength.toString()),
            ],
          );
        },
      ),
    );
  }

  void DirectLoadDataFromApi() async {
    CallingDio callingDio = CallingDio();
    try {
      model = await callingDio.loadFact();
      setState(() {});
    } catch (e) {
      print('something went wrong');
    }
  }
}
