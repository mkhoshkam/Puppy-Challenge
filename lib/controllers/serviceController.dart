import 'package:get/get.dart';
import 'package:puppy_challenge/interfaces/serviceInterface.dart';
import 'package:puppy_challenge/models/categoryModel.dart';
import 'package:puppy_challenge/models/request/animalRequestModel.dart';
import 'package:puppy_challenge/models/request/hotelRequestModel.dart';
import 'package:puppy_challenge/models/request/servicesRequestModel.dart';

class ServiceController extends GetxController implements ServiceInterface{
  late CategoryModel categoryModel;

  RxBool hasGrooming = false.obs;
  RxBool hasHotel = false.obs;
  RxInt nightOfHotel = 1.obs;

  @override
  void onInit() {
    categoryModel = Get.arguments['model'];
    initialData();
    super.onInit();
  }

  @override
  void initialData() {
    int nights = categoryModel.animal!.services!.hotel!.nights!.toInt();
    hasGrooming.value = categoryModel.animal!.services!.grooming!;
    nightOfHotel.value =  nights == 0 ? 1 : nights;
    hasHotel.value =  nights != 0;
  }

  @override
  void submit() {
    Hotel hotel = Hotel(nights: hasHotel.value ? nightOfHotel.value:0);
    Services services = Services(hotel: hotel,grooming: hasGrooming.value);
    Animal animal = Animal(services: services);
    Get.back(result: {"data":animal});
  }

  @override
  void addHotelNight() => nightOfHotel.value++;


  @override
  void minusHotelNight() {
    if(nightOfHotel.value > 1){
      nightOfHotel.value --;
    }
  }
}