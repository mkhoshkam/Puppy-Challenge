import 'dart:convert';

import 'request/animalRequestModel.dart';
/// name : ""
/// image : ""

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());
class CategoryModel {
  CategoryModel({
      String? name, 
      String? image,
      Animal? animal}){
    _name = name;
    _image = image;
    _animal = animal;
}

  CategoryModel.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
  }
  String? _name;
  String? _image;
  Animal? _animal;
CategoryModel copyWith({  String? name,
  String? image,
}) => CategoryModel(  name: name ?? _name,
  image: image ?? _image,
);
  String? get name => _name;
  String? get image => _image;
  Animal? get animal => _animal;

  set animal(Animal? animal){
    _animal = animal;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}