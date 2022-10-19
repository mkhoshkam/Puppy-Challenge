import 'package:flutter/material.dart';
import 'package:puppy_challenge/utils/theme.dart';

import '../models/categoryModel.dart';

Widget categoryItem(CategoryModel categoryModel,
    {
      Function? selectCategory,
      Function? resetFilter,
      Color backgroundColor = Colors.orange
    }) {
  return GestureDetector(
    onTap: ()=>selectCategory!= null ? selectCategory(categoryModel):{},
    child: Container(
      margin:const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.all(12.0),
  width: double.infinity,
  height: 140,
  decoration: BoxDecoration(
  color: backgroundColor,
  borderRadius: BorderRadius.circular(cardRadius)),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(categoryModel.name.toString(),style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
          resetFilter != null ? ElevatedButton(onPressed:()=> resetFilter(categoryModel), child:const Text("Reset Services",style: filterButtonTextStyle,)):Container()
        ],
      ),
      Image.asset(categoryModel.image.toString())
    ],
  ))
  );
}