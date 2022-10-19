import 'dart:convert';
/// total_price : 1000

ResponseCalculate responseCalculateFromJson(String str) => ResponseCalculate.fromJson(json.decode(str));
String responseCalculateToJson(ResponseCalculate data) => json.encode(data.toJson());
class ResponseCalculate {
  ResponseCalculate({
      num? totalPrice,}){
    _totalPrice = totalPrice;
}

  ResponseCalculate.fromJson(dynamic json) {
    _totalPrice = json['total_price'];
  }
  num? _totalPrice;
ResponseCalculate copyWith({  num? totalPrice,
}) => ResponseCalculate(  totalPrice: totalPrice ?? _totalPrice,
);
  num? get totalPrice => _totalPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_price'] = _totalPrice;
    return map;
  }

}