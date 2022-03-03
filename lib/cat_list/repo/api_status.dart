import 'package:mvvm/cat_list/view_models/cat_facts_view_model.dart';
import '../models/cat_fact_model.dart';

class Success {
  int code;
  CatFactsModel response;
  Success({
    required this.code,
    required this.response
  });
}

class Failure {
  int code;
  Object response;
  Failure({
    required this.code,
    required this.response
  });
}