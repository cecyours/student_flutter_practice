class Struct1 {
  String name;
  String address;
  String bod;
  String village;

  Struct1(
      {required this.name,
      required this.address,
      required this.bod,
      required this.village});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'bod': bod,
      'village': village,
    };
  }
}
