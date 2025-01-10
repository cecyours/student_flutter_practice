
import 'package:flutter_test/flutter_test.dart';
import 'package:maulesh_flutter_practice/testing/mock_testing/mock_test_example.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_test_2.mocks.dart';

@GenerateMocks([ApiServiceForMockTest3])
void main(){

  group('Api Service Mock Test', (){
    late MockApiServiceForMockTest3 mockTest3;
    setUp(() {
      mockTest3 = MockApiServiceForMockTest3();
      // mockApiServiceForMockTest2 = MockApiServiceForMockTest2();
    });

    test('api calling mock', () async{


      when(mockTest3.fetchData()).thenAnswer((_) async => "Mocked data");

      final result = await mockTest3.fetchData();

      expect(result, "Mocked data");

    });
  });

}