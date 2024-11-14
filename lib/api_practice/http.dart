import 'package:http/http.dart' as http;

class HttpGet {
  Future<dynamic> call() async {
    Uri uri = Uri.parse(
        'https://member.cecyours.org/api/application/home/66ed55ce626c5bc3791bbefl');

    final response = await http.get(uri);

    print('data is ${response.body}');

    int a = 0;

    if (a == 0) {
      throw AEx();
    } else if (a == 1) {
      throw BEx();
    } else {
      throw CEx();
    }
  }
}

void main() async {
  HttpGet callingDio = HttpGet();

  try {
    await callingDio.call();
  }on AEx{
    print('a error thrown from on');
  }catch (e) {

    print('exception thrown');
  }finally{
    print('pakku karse');
  }
}

class AEx implements Exception {}

class BEx implements Exception {}

class CEx implements Exception {}

class CancelledByDriverExce implements Exception{}