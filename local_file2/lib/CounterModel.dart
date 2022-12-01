class CounterModel{
  int? counter;
  CounterModel({this.counter});
  factory CounterModel.fromjson(Map<String, dynamic>json){
    return CounterModel(counter: json['counter']);
  }
  Map<String, dynamic> toJson()=>{
    'counter': counter
  };
}