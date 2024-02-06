import 'package:bet_app/Api_Service/api_service.dart';
import 'package:bet_app/New_Model/new_model.dart';
import 'package:get/get.dart';

class EventsController extends GetxController{

  RxBool isLoading =true.obs;
Rx<EventsModel?> cricketData = Rx<EventsModel?>(null);
Rx<EventsModel?> soccerData = Rx<EventsModel?>(null);

Rx<EventsModel?> tennisdata = Rx<EventsModel?>(null);

Rx<EventsModel?> horseRacingData = Rx<EventsModel?>(null);
Rx<EventsModel?> greyHoundData = Rx<EventsModel?>(null);


@override
  void onInit() {
    fetchData();
    // TODO: implement onInit
    super.onInit();
  }



  void fetchData()async {


    try{


      isLoading(true);

      var crickketApidata= await ApiService.fetchApi("/events/Cricket");
      var soccerApiData= await ApiService.fetchApi("/events/Soccer");
      var tennisApiData= await ApiService.fetchApi("/events/Tennis");
      var horseRacingApiData= await ApiService.fetchApi("/events/Horse Racing");
      var greyHoundApiData= await ApiService.fetchApi("/events/Greyhounds");

      cricketData.value= crickketApidata;
      soccerData.value= soccerApiData;
      tennisdata.value= tennisApiData;
      horseRacingData.value= horseRacingApiData;
      greyHoundData.value= greyHoundApiData;


    }catch(e){
      print("error"+e.toString());



    } finally{
      isLoading(false);
    }
  }


  void fetchOdds()async {


    try{


      isLoading(true);

      var crickketApidata= await ApiService.fetchApi("/odds/Cricket");
      var soccerApiData= await ApiService.fetchApi("/events/Soccer");
      var tennisApiData= await ApiService.fetchApi("/events/Tennis");
      var horseRacingApiData= await ApiService.fetchApi("/events/Horse Racing");
      var greyHoundApiData= await ApiService.fetchApi("/events/Greyhounds");

      cricketData.value= crickketApidata;
      soccerData.value= soccerApiData;
      tennisdata.value= tennisApiData;
      horseRacingData.value= horseRacingApiData;
      greyHoundData.value= greyHoundApiData;


    }catch(e){
      print("error"+e.toString());



    } finally{
      isLoading(false);
    }
  }



}