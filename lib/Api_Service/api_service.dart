import 'package:bet_app/Api_Service/base_url_service.dart';
import 'package:bet_app/New_Model/new_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService{





  static Future<EventsModel> fetchApi(String route) async{

    var response=await http.get(Uri.parse(base_url+route));

    if(response.statusCode==200){
      return eventsModelFromJson(response.body);
    }
    else{
      throw Exception("network error");
    }



  }
}