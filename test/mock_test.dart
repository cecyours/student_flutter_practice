import 'package:flutter_test/flutter_test.dart';
import 'package:maulesh_flutter_practice/testing/mock_testing/mock_test_example.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ApiServiceForMockTest])
// @GenerateMocks([ApiServiceForMockTest2])
import 'mock_test.mocks.dart'; // Generated mock file
void main() {
  group('ApiService Test', () {
    late MockApiServiceForMockTest mockApiService;
    // late MockApiServiceForMockTest2 mockApiServiceForMockTest2;
    setUp(() {
      mockApiService = MockApiServiceForMockTest();
      // mockApiServiceForMockTest2 = MockApiServiceForMockTest2();
    });

    test('should return mocked data', () async {
      // Arrange
      when(mockApiService.fetchData()).thenAnswer((_) async => "Mocked data");

      // Act
      final result = await mockApiService.fetchData();

      // Assert
      expect(result, "Mocked data");
      verify(mockApiService.fetchData()).called(1); // Ensure it was called
    });

    // test('should return mocked map', () async {
    //   // Arrange
    //   when(mockApiServiceForMockTest2.fetchData()).thenAnswer((_) async => {"ha bhai":"bhai bhai"});
    //
    //   // Act
    //   final result = await mockApiServiceForMockTest2.fetchData();
    //
    //   // Assert
    //   expect(result, {"ha bhai":"bhai bhai"});
    //   verify(mockApiServiceForMockTest2.fetchData()).called(1); // Ensure it was called
    // });

  });
}