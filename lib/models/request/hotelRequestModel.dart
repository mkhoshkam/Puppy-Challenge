import 'dart:convert';

Hotel hotelFromJson(String str) => Hotel.fromJson(json.decode(str));
String hotelToJson(Hotel data) => json.encode(data.toJson());
class Hotel {
  Hotel({
    num? nights,}){
    _nights = nights;
  }

  Hotel.fromJson(dynamic json) {
    _nights = json['nights'];
  }
  num? _nights;
  Hotel copyWith({  num? nights,
  }) => Hotel(  nights: nights ?? _nights,
  );
  num? get nights => _nights;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nights'] = _nights;
    return map;
  }

}