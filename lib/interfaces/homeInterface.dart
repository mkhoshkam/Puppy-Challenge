import 'package:puppy_challenge/models/categoryModel.dart';

class HomeInterface{
  void calculate(){}
  void selectCategory(CategoryModel categoryModel){}
  void initializeRequest(){}
  void initializeRepositories(){}
  void calculateIsLoading(bool state){}
  void resetFilter(CategoryModel categoryModel){}
}