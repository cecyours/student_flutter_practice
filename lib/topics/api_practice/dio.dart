import 'dart:io';

import 'package:dio/dio.dart';

class CallingDioGet {
  Future<dynamic> call() async {
    Dio dio = Dio();

    // final Response response = await dio.get(
    //     'https://member.cecyours.org/api/application/home/67358f210ccfbbae39eca02b');
    //
    // Map<String, dynamic> json = response.data;
    // print('data is ${response.data['member']['member_branch_ids'][0]}');

    try {
      final Response response = await dio.get(
          'https://member.cecyours.org/api/application/home/67358f210ccfbbae39eca02b');

      Map<String, dynamic> json = response.data;
      print('full data ${response.data}');
      print('data is ${response.data['member']['member_branch_ids'][0]}');
    } catch (e) {
      print(e.runtimeType);
      if (e is DioException && e.type == DioExceptionType.connectionError) {
        // print('${e.type}');
        print('dfgahsguiydf');
        throw ConnectionException();
      }

      if (e is DioException && e.response?.statusCode == 404) {
        throw NotFoundException();
      }
      if (e is SocketException) {
        print('socket error');
        return;
      }
    }
  }
}

class CallingDioPost {
  Future<dynamic> call() async {
    Dio dio = Dio();

    final Response response = await dio.post(
        'https://member.cecyours.org/api/application/calender/past-daily-report',
        data: {
          "member_id": "67358f210ccfbbae39eca02b",
        });

    print('data is ${response.data['groupedEntries']}');
  }
}

class SachumaPost {
  Future<dynamic> call() async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "member_id": "66ed55ce626c5bc3791bbefj",
      "report_date": "2024-10-13T00:00:00.000Z",
      "tasks_completed": ["task1", "task2"],
      "tasks_in_progress": ["progress one", "progress two"],
      "issues_encountered": "",
      "plans_for_tomorrow": ["nothing"],
      "additional_notes": ""
    };

    try {
      final Response response = await dio.post(
          'https://member.cecyours.org/api/main/daily-report/add/add',
          data: data);

      return response.data;
    } catch (e) {
      if (e is DioException) {
        print('dio => error is : ${e.response?.statusMessage}');
      }
    }
  }
}

class ConnectionException implements Exception {}

class NotFoundException implements Exception {}

void main() async{

  try {
    CallingDioGet callingDio = CallingDioGet();
    dynamic data = await callingDio.call();
  }on ConnectionException{
    print('ConnectionException mistake mistake');
  }catch (e) {

    if (e is NotFoundException) {
      print('NotFoundException is mistake');
    }
  }
}

