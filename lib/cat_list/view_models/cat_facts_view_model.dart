import 'package:flutter/material.dart';
import 'package:mvvm/cat_list/models/cat_fact_model.dart';
import 'package:mvvm/cat_list/repo/api_status.dart';
import 'package:mvvm/cat_list/repo/cat_services.dart';
import 'dart:convert';
class CatFactsViewModel extends ChangeNotifier {

  bool _loading = false;
  List<CatFactsModel> _catFactsListModel = [];
  //CatFactError _catFactError;

  bool get loading => _loading;
  List<CatFactsModel> get catFactsListModel => _catFactsListModel;
  //CatFactError get catFactError => _catFactError;

  CatFactsViewModel(){
    getCatFacts();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setCatFactsUserListModel(CatFactsModel catFactsModel){
    _catFactsListModel.add(catFactsModel);
    print("Lunghezza" + catFactsListModel.length.toString());
    notifyListeners();
  }

 /* setCatFactError(CatFactError catFactError){
    _catFactError = catFactError;
  }*/

  getCatFacts() async{
    setLoading(true);
    var response = await CatServices.getCatFacts();


    if(response is Success){
      var respons = response;
      print(response);
      setCatFactsUserListModel(response.response);
    }
    if(response is Failure){
      print(response);
      var respons = response.response;
      print("error" + respons.toString());
    }
    /*if(response is Failure){
      CatFactError catFactError = CatFactError(
        code:response.code,
        message: response.errorResponse
      );
      setCatFactError(catFactError);
    }*/
    setLoading(false);
  }
}