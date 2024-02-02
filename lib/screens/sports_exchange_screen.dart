import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:flutter/material.dart';

class SportsExchangeScreen extends StatefulWidget {
  const SportsExchangeScreen({super.key});

  @override
  State<SportsExchangeScreen> createState() => _SportsExchangeScreenState();
}

class _SportsExchangeScreenState extends State<SportsExchangeScreen> {
    List listNavigate=["/market","/inplayEve",'/inplay','/cric', '/soccer','/tennis','/horse','/grey'];
    List listTitle=["My Markets","Inplay Events","Inplay Soon ","Cricket","Soccer","Tennis","Horse Race Today Card","Greyhound-Todays Card"];
         late NavigationService _navigate;

  @override
  Widget build(BuildContext context) {
        _navigate=NavigationService();

       double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,

        backgroundColor:AppColors.appBarColor ,
        title: Text("Select Event",style: TextStyle(color: Colors.white),),),
      body: Column(
        children: [
          Expanded(
            child: Padding(
            padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),

              child: ListView.builder(
                itemCount: listTitle.length,
                      
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      _navigate.navigateToRoute(listNavigate[index]);
                      
                    },
                    child:Container(
                      height: height*0.05,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: AppColors.containerColor
                      
                      ),
                      child: Center(child: Text(listTitle[index],style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:22,color: AppColors.containerTextColor),)),
                      
                    )
                  );
                }),
            )
          )

      ]),
    );
  }
}