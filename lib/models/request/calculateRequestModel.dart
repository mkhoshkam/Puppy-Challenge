import 'dart:convert';

import 'package:puppy_challenge/models/request/animalRequestModel.dart';

/// dog : {"services":{"grooming":true,"hotel":{"nights":2}}}
/// cat : {"services":{"grooming":false,"hotel":{"nights":3}}}

CalculatorRequest requestFromJson(String str) => CalculatorRequest.fromJson(json.decode(str));
String requestToJson(CalculatorRequest data) => json.encode(data.toJson());
class CalculatorRequest {
  CalculatorRequest({
    Animal? dog,
    Animal? cat,}){
    _dog = dog;
    _cat = cat;
}

  CalculatorRequest.fromJson(dynamic json) {
    _dog = json['dog'] != null ? Animal.fromJson(json['dog']) : null;
    _cat = json['cat'] != null ? Animal.fromJson(json['cat']) : null;
  }
  Animal? _dog;
  Animal? _cat;
CalculatorRequest copyWith({  Animal? dog,
  Animal? cat,
}) => CalculatorRequest(  dog: dog ?? _dog,
  cat: cat ?? _cat,
);
  Animal? get dog => _dog;
  Animal? get cat => _cat;

  set dog(Animal? value) {
    _dog = value;
  }

  set cat(Animal? value) {
    _cat = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dog != null) {
      map['dog'] = _dog?.toJson();
    }
    if (_cat != null) {
      map['cat'] = _cat?.toJson();
    }
    return map;
  }

}

