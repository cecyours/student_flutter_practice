class SampleJson {
  static Map<String, dynamic> json1 = {
    "name": "pavan",
    "age": 22,
    "std": "12th",
  };

  static Map<String, dynamic> json2 = {
    "name": "pavan",
    "age": 22,
    "std": "12th",
    "street Address": "vatva",
    "state": 'Gujarat',
    "country": "india",
  };

  static Map<String, dynamic> sampleJson1 = {
    "menu": {
      "id": "file",
      "value": "File",
      "popup": {
        "menuitem": [
          {
            "value": "New",
            "onclick": "CreateDoc()"
          },
          {
            "value": "Open",
            "onclick": "OpenDoc()"
          },
          {
            "value": "Save",
            "onclick": "SaveDoc()"
          }
        ]
      }
    }
  };

  static Map<String, dynamic> sampleJson2 = {
    "employees": [
      {"name": "Shyam", "email": "shyamjaiswal@gmail.com"},
      {"name": "Bob", "email": "bob32@gmail.com"},
      {"name": "Jai", "email": "jai87@gmail.com"}
    ]
  };

// static Map<String, dynamic> sampleJson3 = {
//   "dashboard": {
//     "title": "User Dashboard",
//     "user": {
//       "id": 12345,
//       "name": "John Doe",
//       "email": "john.doe@example.com",
//       "profile": {
//         "age": 30,
//         "address": {
//           "street": "123 Elm St",
//           "city": "Gotham",
//           "zipcode": "12345"
//         },
//         "preferences": ["dark_mode", "email_notifications"]
//       }
//     },
//     "widgets": [
//       {
//         "type": "chart",
//         "settings": {
//           "chartType": "line",
//           "data": [
//             {"x": "2024-01-01", "y": 20},
//             {"x": "2024-01-02", "y": 25},
//             {"x": "2024-01-03", "y": 30}
//           ]
//         }
//       },
//       {
//         "type": "list",
//         "settings": {
//           "items": [
//             {"name": "Task 1", "completed": true},
//             {"name": "Task 2", "completed": false},
//             {"name": "Task 3", "completed": true}
//           ],
//           "sortable": true
//         }
//       }
//     ],
//     "last_login": "2024-10-01T08:30:00Z"
//   }
// };
}
