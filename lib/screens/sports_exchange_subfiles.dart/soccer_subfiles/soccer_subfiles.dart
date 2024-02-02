// import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Services/services.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer_subfiles/soccer_subfiles_2/soccer_subfiles.dart';
import 'package:flutter/material.dart';

class SoccerSubfiles extends StatefulWidget {
  const SoccerSubfiles({super.key});

  @override
  State<SoccerSubfiles> createState() => _SoccerSubfilesState();
}

class _SoccerSubfilesState extends State<SoccerSubfiles> {
    List listNavigate=["/market","/inplayEve",'/inplay','/cric', '/soccer','/tennis','/horse','/grey'];
    List listTitle=["My Markets","Inplay Events","Inplay Soon ","Cricket","Soccer","Tennis","Horse Race Today Card","Greyhound-Todays Card"];
        //  late NavigationService _navigate;
         

  @override
  Widget build(BuildContext context) {
        Services serv=Services();

        // _navigate=NavigationService();

       double height=MediaQuery.of(context).size.height;
    // double width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        backgroundColor:AppColors.appBarColor ,
        title: Text("Select Event",style: TextStyle(color: Colors.white),),),
      body: Column(
        children: [
           Expanded(
            child: FutureBuilder<List<dynamic>>(
            future:serv.fetchSportsData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator()); // Loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<dynamic> data = snapshot.data!;
                //  List<String> sportsToFilter = ['tennis', 'Soccer', 'Cricket'];


       List<dynamic>  filteredData = data.where((item) => item["active"]==true)
        .toList() ;
             List<dynamic>  filteredData2 = filteredData.where((item) => item["group"].toLowerCase().contains("Soccer".toLowerCase()))
        .toList() ;
        
     

        
                
                return Padding(
            padding: EdgeInsets.only(top: height*0.04,left: height*0.04,right:  height*0.04),
                  child: ListView.builder(
             itemCount: filteredData2.length,                        
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SoccerSubfiles2(keyNew: filteredData2[index]["key"],)));
                      },
                      child:Container(
                        height: height*0.05,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: AppColors.containerColor
                        
                        ),
                        child: Center(child: Text( filteredData2[index]["description"].toString(),style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:22,color: AppColors.containerTextColor),)),
                        
                      )
                    );
                  }),
                );
              }
            },
          ),
          )
        

      ]),
    );
  }
}