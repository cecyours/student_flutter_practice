class ApiServiceForMockTest {
  Future<String> fetchData() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    return "Real data";
  }
}

// class ApiServiceForMockTest2 {
//   Future<Map<String, dynamic>> fetchData() async {
//     // Simulate a network call
//     await Future.delayed(Duration(seconds: 2));
//     return {
//       "Real data":'ha bhai'
//     };
//   }
// }

class ApiServiceForMockTest3 {
  Future<String> fetchData() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    return "Real data";
  }
}

