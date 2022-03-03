import 'dart:io';

import 'package:mvvm/cat_list/models/cat_fact_model.dart';
import 'package:mvvm/cat_list/repo/api_status.dart';
import 'package:http/http.dart' as http;

class CatServices {

  static Future<Object?> getCatFacts()async{
    try{
      var url = Uri.parse("https://catfact.ninja/facts");
      var response = await http.get(url);
      print(response.statusCode);
      print(response.body);
      if(response.statusCode == 200){
        print("retirn Success");
        return Success(code: 200, response: catFactFromJson(response.body));
      } else {
        print("retirn error");
        return Failure(code: 100, response: "Invalid Response");
      } 
    } on HttpException {
      return Failure(code: 101, response: "No Internet");
    } on FormatException {
      return Failure(code: 102, response: "Invalid Format");
    } catch (e) {
      return Failure(code: 103, response: "Unknown Error:" + e.toString());
    }
  }
}