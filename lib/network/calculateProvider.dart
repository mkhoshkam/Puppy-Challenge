import 'package:get/get.dart';

class CalculateProvider extends GetConnect {

  Future<Response> calculate(Map data) => post('https://assignment.shly.me', data,);

}