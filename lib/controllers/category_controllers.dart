import 'dart:convert';
import 'dart:developer';

import 'package:ecom_app/api/api_constants.dart';
import 'package:ecom_app/models/categories_models.dart';

import 'package:http/http.dart' as http;

class CategoryController {


  Future<List<Categories>?> fetchAllCategoriesData() async {
    try {
        final url = Uri.parse('${ApiConstants.baseURL}${ApiConstants.productsURL}${ApiConstants.allCategoriesURL}');
        final response = await http.get(url);

        if(response.statusCode == 200)
        {
          List<dynamic> data = json.decode(response.body);
          //  print(data);
          List<Categories> allCategoryList = data.map((category) => Categories.fromJson(category)).toList();
         
          return allCategoryList; 
        }
        else
        {
             throw Exception('Failed to Load Data');

        }

    } catch (e) {
         log(e.toString());
         return [];
         
    }
  }
}
