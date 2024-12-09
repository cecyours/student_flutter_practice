class Menu{
  String id;
  String value;
  PopUp popUp;

  Menu({
    required this.id,
    required this.value,
    required this.popUp
});
  factory Menu.fromJson({required Map<String, dynamic> json}){
    return Menu(id: json['id'], value:  json['value'], popUp:  json['popup']);
  }

}

class PopUp{
  List<Menuitem> menu;

  PopUp({
    required this.menu
});

  factory PopUp.fromJson({ required List<Map<String, dynamic>> json} ){
    return PopUp(menu: json.map((item)=> Menuitem.fromJson(json: item)).toList());
  }
}

class Menuitem {
  String value;
  String onclick;

  Menuitem({
    required this.value,
    required this.onclick
});

  factory Menuitem.fromJson({required Map<String , dynamic> json}){
    return Menuitem(value: json['value'], onclick: json['onclick']);
  }
}




