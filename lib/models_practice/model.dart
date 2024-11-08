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
// =======================================================================

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

// =======================================================================
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
// =======================================================================

class Model4 {
  DashBoard dashBoard;

  Model4({required this.dashBoard});

  factory Model4.fromJson({required Map<String, dynamic> jsonMain}) {
    return Model4(dashBoard: DashBoard.fromJson(json5: jsonMain['dashboard']));
  }
}

class DashBoard {
  String title;
  User user;
  List<Widget> widgets;
  String lastLogin;

  DashBoard(
      {required this.title,
      required this.user,
      required this.widgets,
      required this.lastLogin});

  factory DashBoard.fromJson({required Map<String, dynamic> json5}) {
    return DashBoard(
        title: json5['title'],
        user: User.fromJson(json1: json5['user']),
        widgets: (json5['widgets'] as List)
            .map((emp) => Widget.fromJson(json: emp))
            .toList(),
        lastLogin: json5['last_login']);
  }
}

class User {
  int id;
  String name;
  String email;
  Profile profile;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.profile});

  factory User.fromJson({required Map<String, dynamic> json1}) {
    return User(
        id: json1['id'],
        name: json1['name'],
        email: json1['email'],
        profile: Profile.fromJson(json8: json1['profile']));
  }
}

class Profile {
  int age;
  List<String> preferences;
  Address address;

  Profile(
      {required this.age, required this.preferences, required this.address});

  factory Profile.fromJson({required Map<String, dynamic> json8}) {
    return Profile(
        age: json8['age'],
        preferences: json8['preferences'],
        address: Address.fromJson(json7: json8['address']));
  }
}

class Address {
  String street;
  String city;
  String zipcode;

  Address({required this.street, required this.city, required this.zipcode});

  factory Address.fromJson({required Map<String, dynamic> json7}) {
    return Address(
        street: json7['street'],
        city: json7['city'],
        zipcode: json7['zipcode']);
  }
}

class Widget {
  String type;
  Setting setting;

  Widget({required this.type, required this.setting});

  factory Widget.fromJson({required Map<String, dynamic> json}) {
    return Widget(
        type: json['type'], setting: Setting.fromJson(json3: json['settings']));
  }
}

class Setting {
  List<abc> d1;
  String? chattype;
  bool? sortable;

  Setting({this.chattype, required this.d1, this.sortable});

  factory Setting.fromJson({required Map<String, dynamic> json3}) {
    return Setting(
        d1: json3['data'] != null
            ? (json3['data'] as List)
                .map((emp) => Data.fromJson(json2: emp))
                .toList()
            : (json3['items'] as List)
                .map((emp) => Items.fromJson(json: emp))
                .toList(),
        chattype: json3['chartType'],
        sortable: json3['sortable']);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> h = [];

    for (abc a in d1) {
      if (a is Items) {
        h.add(a.toJson());
      } else {
        h.add((a as Data).toJson());
      }
    }

    return {'i': h, 'chartType': chattype, 'sortable': sortable};
  }
}

class abc {}

class Data extends abc {
  String x;
  int y;

  Data({required this.x, required this.y});

  factory Data.fromJson({required Map<String, dynamic> json2}) {
    return Data(x: json2['x'], y: json2['y']);
  }

  Map<String, dynamic> toJson() {
    return {'x': x, 'y': y};
  }
}

class Items extends abc {
  String name;
  bool completed;

  Items({required this.name, required this.completed});

  factory Items.fromJson({required Map<String, dynamic> json}) {
    return Items(name: json['name'], completed: json['completed']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'completed': completed};
  }
}
