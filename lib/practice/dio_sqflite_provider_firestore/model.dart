class FactModel{
  String fact;
  int factLength;
  FactModel({required this.fact, required this.factLength});

  factory FactModel.fromJson({required Map<String, dynamic> json}){
    return FactModel(fact: json['fact'], factLength: json['length']);
  }

  Map<String,dynamic> toJson(){
   return {
     "fact":fact,
     "length":factLength
   };
  }

}