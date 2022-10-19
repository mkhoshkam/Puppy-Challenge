import 'dart:convert';

import 'hotelRequestModel.dart';

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));
String servicesToJson(Services data) => json.encode(data.toJson());
class Services {
  Services({
    bool? grooming,
    Hotel? hotel,}){
    _grooming = grooming;
    _hotel = hotel;
  }

  Services.fromJson(dynamic json) {
    _grooming = json['grooming'];
    _hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
  }
  bool? _grooming;
  Hotel? _hotel;
  Services copyWith({  bool? grooming,
    Hotel? hotel,
  }) => Services(  grooming: grooming ?? _grooming,
    hotel: hotel ?? _hotel,
  );
  bool? get grooming => _grooming;
  Hotel? get hotel => _hotel;

  set grooming(bool? value) {
    grooming = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['grooming'] = _grooming;
    if (_hotel != null) {
      map['hotel'] = _hotel?.toJson();
    }
    return map;
  }

}