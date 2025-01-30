import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'notification_service.dart';

class BackgroundServiceUi extends StatefulWidget {
  const BackgroundServiceUi({super.key});

  @override
  State<BackgroundServiceUi> createState() => _BackgroundServiceUiState();
}

class _BackgroundServiceUiState extends State<BackgroundServiceUi> {
  final service  = FlutterBackgroundService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationService.getPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton(onPressed: ()async{
                if(await service.isRunning() == false){
                  await service.startService();
                }
              }, child: Text('start service')),
              SizedBox(height: 20,),
              FilledButton(onPressed: () async{
                var isRunning = await service.isRunning();
                isRunning
                    ? service.invoke("stopService")
                    : print('service already stopped');
              }, child: Text('stop Service'))

            ],
          ),
      ),
    );
  }
}
