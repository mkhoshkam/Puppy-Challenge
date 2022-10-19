import 'package:get/get.dart';
import 'package:puppy_challenge/interfaces/homeInterface.dart';
import 'package:puppy_challenge/models/request/animalRequestModel.dart';
import 'package:puppy_challenge/models/request/calculateRequestModel.dart';
import 'package:puppy_challenge/repositories/calculateRepository.dart';

import '../interfaces/catInterface.dart';
import '../interfaces/dogInterface.dart';
import '../models/categoryModel.dart';
import '../models/request/hotelRequestModel.dart';
import '../models/request/servicesRequestModel.dart';
import '../models/response/responseCalculate.dart';
import '../network/calculateProvider.dart';
import '../utils/routes.dart';

class HomeController extends GetxController implements HomeInterface,CatInterface,DogInterface {
  RxInt calculatedAmount = 0.obs;
  RxBool isCalculating = false.obs;
  late CalculatorRequest calculatorRequest;
  late CalculateRepository calculateRepository;

  @override
  void onInit() {
    initializeRepositories();
    initializeRequest();
    super.onInit();
  }

  @override
  void calculate() {
    calculateIsLoading(true);
    calculateRepository.calculateFromServer(calculatorRequest.toJson())
        .then((response){
      calculateIsLoading(false);
          if(response.status.isOk){
            try{
              calculatedAmount.value = responseCalculateFromJson(response.bodyString.toString()).totalPrice!.toInt();
            }catch(_){
             calculateIsLoading(false);
            }
          }
    })
        .onError((error, stackTrace) {});
  }

  @override
  void selectCategory(CategoryModel categoryModel) {
    categoryModel.animal = categoryModel.name == "cat" ? calculatorRequest.cat : calculatorRequest.dog;
    Get.toNamed(Routes.service, arguments: {'model': categoryModel})
        ?.then((value) {
          try{
            Animal animal =value['data'] as Animal;
            if(categoryModel.name == "cat"){
              calculatorRequest.cat = animal;
            }else{
              calculatorRequest.dog = animal;
            }
          }catch(_){}
    });
  }

  @override
  void initializeRequest() {
    Animal animal = initializeAnimalModel();
    calculatorRequest = CalculatorRequest(cat: animal,dog: animal);
  }

  Animal initializeAnimalModel(){
    Hotel hotel = Hotel(nights: 0);
    Services services = Services(hotel: hotel,grooming: false);
    Animal animal = Animal(services: services);
    return animal;
  }

  @override
  void calculateIsLoading(bool state) => isCalculating.value = state;

  @override
  void initializeRepositories() => calculateRepository = CalculateRepository();

  @override
  void resetFilter(CategoryModel categoryModel) {
    categoryModel.name == "cat" ? resetCatFilters():resetDogFilters();
  }

  @override
  void resetCatFilters() {
    Animal animal = initializeAnimalModel();
    calculatorRequest.cat = animal;
  }

  @override
  void resetDogFilters() {
    Animal animal = initializeAnimalModel();
    calculatorRequest.dog = animal;
  }
}
