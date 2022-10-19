import 'package:get/get_connect/http/src/response/response.dart';
import 'package:puppy_challenge/network/calculateProvider.dart';

class CalculateRepository{
  late CalculateProvider calculateProvider;

  CalculateRepository(){
    calculateProvider= CalculateProvider();
  }

  int calculateFromLocal(Map data) {
    //todo
    return 0;
  }

  Future<Response> calculateFromServer(Map data) => calculateProvider.calculate(data);
}