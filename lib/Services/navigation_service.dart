
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationService{


  static GlobalKey<NavigatorState> navigatorKey=GlobalKey<NavigatorState>();

  void removeAndNavigateToRoute(String _route){
    navigatorKey.currentState?.popAndPushNamed(_route);

  }
   void navigateToRoute(String _route){
    navigatorKey.currentState?.pushNamed(_route);
    

  }
     void navigateToRoute1(String _route,Map<String,String> argu){
    navigatorKey.currentState?.pushNamed(_route,arguments: argu);
    

  }


   void navigateToPage(Widget _page){
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (BuildContext _context){
      return _page;

    }));

  }

   void goBack(){
    navigatorKey.currentState?.pop();

  }


}