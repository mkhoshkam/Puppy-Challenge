import 'dart:convert';

import 'package:puppy_challenge/models/request/servicesRequestModel.dart';


Animal animalFromJson(String str) => Animal.fromJson(json.decode(str));
String animalToJson(Animal data) => json.encode(data.toJson());
class Animal {
  Animal({
    Services? services,}){
    _services = services;
  }

  Animal.fromJson(dynamic json) {
    _services = json['services'] != null ? Services.fromJson(json['services']) : null;
  }
  Services? _services;
  Animal copyWith({  Services? services,
  }) => Animal(  services: services ?? services,
  );

  Services? get services => _services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_services != null) {
      map['services'] = _services?.toJson();
    }
    return map;
  }

}
