class Model {
  String name;
  int age;
  String std;

  Model({
    required this.name,
    required this.age,
    required this.std,
  });

  factory Model.fromJson({required Map<String, dynamic> json}) {
    return Model(name: json['name'], age: json['age'], std: json['std']);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "std": std,
    };
  }
}

class Model1 {
  String name;
  int age;
  String std;
  String street_Address;
  String state;
  String country;

  Model1({
    required this.name,
    required this.age,
    required this.std,
    required this.street_Address,
    required this.state,
    required this.country,
  });

  factory Model1.takeFromJson({required Map<String, dynamic> json}) {
    return Model1(
        name: json['name'],
        age: json['age'],
        std: json['std'],
        street_Address: json['street Address'],
        state: json['state'],
        country: json['country']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'std': std,
      'street Address': street_Address,
      'age': state,
      'country': country
    };
  }
}
