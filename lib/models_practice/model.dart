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

class Model2 {
  Menu menu;

  factory Model2.fromJson({required Map<String, dynamic> json}) {
    return Model2(menu: Menu.fromJson(mjson: json['menu']));
  }

  Model2({required this.menu});
}

class Menu {
  String id;
  String value;
  PopUp popUp;

  factory Menu.fromJson({required Map<String, dynamic> mjson}) {
    return Menu(
        id: mjson['id'],
        value: mjson['value'],
        popUp: PopUp.fromJson(ejson: mjson['popup']));
  }

  Menu({required this.id, required this.value, required this.popUp});
}

class PopUp {
  List<MenuItems> menuItems;

  factory PopUp.fromJson({required Map<String, dynamic> ejson}) {
    return PopUp(
        menuItems: (ejson['menuitem'] as List)
            .map((menuItem) => MenuItems.fromJson(json: menuItem))
            .toList());
  }

  PopUp({required this.menuItems});
}

class MenuItems {
  String value;
  String onclick;

  factory MenuItems.fromJson({required Map<String, dynamic> json}) {
    return MenuItems(value: json['value'], onclick: json['onclick']);
  }

  MenuItems({required this.value, required this.onclick});
}

//////////////////////////////////////////////////////////////////////////////////////////////////////

class Model3 {
  Emplopyees Emp1;

  Model3({required this.Emp1});

  factory Model3.fromJson({required Map<String, dynamic> json6}) {
    return Model3(Emp1: Emplopyees.fromJson(Json5: json6));
  }
}

class Emplopyees {
  List<Emp> emps;

  factory Emplopyees.fromJson({required Map<String, dynamic> Json5}) {
    return Emplopyees(
        emps: (Json5['employees'] as List)
            .map((emp) => Emp.fromJson(json4: emp))
            .toList());
  }

  Emplopyees({required this.emps});
}

class Emp {
  String name;
  String email;

  Emp({required this.name, required this.email});

  factory Emp.fromJson({required Map<String, dynamic> json4}) {
    return Emp(name: json4['name'], email: json4['email']);
  }
}
