import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:interview/MODELS/Model.dart';

class ControllingClass {
  Dio dio = Dio();
  Future<ModelClass> controller() async {
    var url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=water';
    Response urlvar = await dio.get(url);
    var jsondecode;
    // var response = await json.decode(urlvar.data);
    if (urlvar.statusCode == 200) {
      print(urlvar.data);
    }
    jsondecode = ModelClass.fromJson(urlvar.data);

    return jsondecode;
  }
}
