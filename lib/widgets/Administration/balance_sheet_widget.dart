import 'package:bet_app/Firebase/firebase_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BalanceSheetWidget extends StatefulWidget {
  const BalanceSheetWidget({super.key});

  @override
  State<BalanceSheetWidget> createState() => _BalanceSheetWidgetState();
}

class _BalanceSheetWidgetState extends State<BalanceSheetWidget> {


     List<String> usernames = [];
  List<String> amounts = [];

   

   



  @override
  void initState() {
    super.initState();
    fetchUsername().then((data){
      setState(() {
       usernames = data;

        
      });
      
  
      
    

    });
      fetchAmount().then((data) {
      setState(() {
        amounts = data;
      });
  
  
      
    

    });

      
    
   
  }
    Future<List<String>> fetchAmount() async {
    try {
      QuerySnapshot posts = await FirebaseFirestore.instance.collection('posts').get();
      List<String> amounts = posts.docs
          .map((doc) {
            final postData = doc.data() as Map<String, dynamic>;
            return postData['amount'].toString(); // Cast to String
          })
          .toList();
      return amounts;
    } catch (e) {
      print("Error fetching amounts: $e");
      return [];
    }
  }

  
  @override
  Widget build(BuildContext context) {
     double sum = amounts
        .map((amount) => double.parse(amount))
        .fold(0, (previous, current) => previous + current);
      double fontSize=12;
    double fontSizeText=12;

     Color color=Colors.purple;
      Color colorRed=Colors.red;

          Color colorGreen=Colors.green;

       double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return 
        Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text("----------",style: TextStyle(fontSize: fontSize,color:color,height: 0.002),),
                         Text("----------",style: TextStyle(fontSize: fontSize,color:color,),),
                                  Text("Name",style: TextStyle(fontSize: fontSize,color:color,),),
                                  Text("----------",style: TextStyle(fontSize: fontSize,color:color),),
                                  Text("----------",style: TextStyle(fontSize: fontSize,color:color,height: 0.002),),
                                                                    SizedBox(height: height*0.03,),
        
                    usernames.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        shrinkWrap: true,
                          itemCount: usernames.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  children: [
                                 
                      
                                    SizedBox(height: height*0.02,),
                      
                                    Row(
                                      children: [
                                        Text((index+1).toString()+".",style: TextStyle(fontSize: fontSize,color:color,height: 0.02),),
                                        Text(usernames[index].toString(),style: TextStyle(fontSize: fontSize,color:color,height: 0.02),)
                                      ],
                                    ),
                                    SizedBox(height: height*0.03,),
                          
                                  ],
                                )
                      
                              ],
                            );
                          
                          },
                        ),
                         Text("----------",style: TextStyle(fontSize: fontSize,color:color,height: 0.002),),
                         Text("----------",style: TextStyle(fontSize: fontSize,color:color,),),
                                                SizedBox(height: height*0.03,),
        
                        Text("Total",style: TextStyle(fontSize: fontSize,color:color,),),
        
                  ],
                ),
              ),
        
        
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text("----------",style: TextStyle(fontSize: fontSize,color:colorGreen,height: 0.002),),
                         Text("----------",style: TextStyle(fontSize: fontSize,color:colorGreen,),),
                                  Text("Amount",style: TextStyle(fontSize: fontSize,color:colorGreen,),),
                                  Text("----------",style: TextStyle(fontSize: fontSize,color:colorGreen),),
                                  Text("----------",style: TextStyle(fontSize: fontSize,color:colorGreen,height: 0.002),),
                                                                    SizedBox(height: height*0.03,),
        
                    usernames.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        shrinkWrap: true,
                          itemCount: amounts.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  children: [
                                 
                      
                                    SizedBox(height: height*0.02,),
                      
                                    Row(
                                      children: [
                                        Text(amounts[index].toString(),style: TextStyle(fontSize: fontSize,color:colorGreen,height: 0.02),)
                                      ],
                                    ),
                                    SizedBox(height: height*0.03,),
                          
                                  ],
                                )
                      
                              ],
                            );
                          
                          },
                        ),
                         Text("----------",style: TextStyle(fontSize: fontSize,color:colorGreen,height: 0.002),),
                         Text("----------",style: TextStyle(fontSize: fontSize,color:colorGreen,),),
        
                         SizedBox(height: height*0.03,),
                        Text(sum.toString(),style: TextStyle(fontSize: fontSize,color:colorGreen,),),
        
                  ],
                ),
              ),
              Expanded(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text("----------",style: TextStyle(fontSize: fontSize,color:color,height: 0.002),),
                     Text("----------",style: TextStyle(fontSize: fontSize,color:color,),),
                              Text("Name",style: TextStyle(fontSize: fontSize,color:color,),),
                              Text("----------",style: TextStyle(fontSize: fontSize,color:color),),
                              Text("----------",style: TextStyle(fontSize: fontSize,color:color,height: 0.002),),
                                                                SizedBox(height: height*0.03,),
                      
                usernames.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Column(
                              children: [
                             
                  
                                SizedBox(height: height*0.02,),
                  
                                Row(
                                  children: [
                                    Text(("1").toString()+".",style: TextStyle(fontSize: fontSize,color:color,height: 0.02),),
                                    Text("Hawala Ad..",overflow:TextOverflow.ellipsis,style : TextStyle(fontSize: fontSize,color:color,height: 0.02),)
                                  ],
                                ),
                                SizedBox(height: height*0.03,),
                      
                              ],
                            )
                  
                          ],
                        );
                      
                      },
                    ),
                    //  Text("----------",style: TextStyle(fontSize: fontSize,color:color,height: 0.002),),
                    //  Text("----------",style: TextStyle(fontSize: fontSize,color:color,),),
                    //                         SizedBox(height: height*0.03,),
                      
                    // Text("Total",style: TextStyle(fontSize: fontSize,color:color,),),
                      
                ],
                ),
              ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("----------",style: TextStyle(fontSize: fontSize,color:colorRed,height: 0.002),),
                   Text("----------",style: TextStyle(fontSize: fontSize,color:colorRed,),),
                            Text("Amount",style: TextStyle(fontSize: fontSize,color:colorRed,),),
                            Text("----------",style: TextStyle(fontSize: fontSize,color:colorRed),),
                            Text("----------",style: TextStyle(fontSize: fontSize,color:colorRed,height: 0.002),),
                                                              SizedBox(height: height*0.03,),
                    
              usernames.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                  shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                 
                       
                      return Row(
                        children: [
                          Column(
                            children: [
                           
                
                              SizedBox(height: height*0.02,),
                
                              Row(
                                children: [
                                
                    
                               Text(sum.toString(),style: TextStyle(fontSize: fontSize,color:colorRed,),),
                                ],
                              ),
                              SizedBox(height: height*0.03,),
                    
                            ],
                          )
                
                        ],
                      );
                    
                    },
                  ),
                  //  Text("----------",style: TextStyle(fontSize: fontSize,color:colorRed,height: 0.002),),
                  //  Text("----------",style: TextStyle(fontSize: fontSize,color:colorRed,),),
                    
                  //  SizedBox(height: height*0.03,),
                  // Text(sum.toString(),style: TextStyle(fontSize: fontSize,color:colorRed,),),
                    
                ],
              ),
            ),
                
            ],
          );
  
    


  }
 Future<List<Map<String, String>>> fetchUsernamesWithDocIds() async {
    try {
      QuerySnapshot users = await FirebaseFirestore.instance.collection('users').get();
      List<Map<String, String>> usernamesWithDocIds = users.docs
          .where((doc) {
            final userData = doc.data() as Map<String, dynamic>;
            final role = userData['role'] as String;
            return role != 'admin' && role != 'master';
          })
          .map((doc) {
            final userData = doc.data() as Map<String, dynamic>;
            final username = userData['username'] as String;
            final docId = doc.id;
            return {'username': username, 'docId': docId};
          })
          .toList();
      return usernamesWithDocIds;
    } catch (e) {
      print("Error fetching usernames with doc IDs: $e");
      return [];
    }
  }



  Future<List<String>> fetchUsername() async {
  try {
    QuerySnapshot users = await FirebaseFirestore.instance.collection('users').get();
    List<String> usernames = users.docs
        .where((doc) {
          final userData = doc.data() as Map<String, dynamic>;
          final role = userData['role'] as String;
          return role != 'admin' && role != 'master';
        })
        .map((doc) {
          final userData = doc.data() as Map<String, dynamic>;
          return userData['username'] as String;
        })
        .toList();
    return usernames;
  } catch (e) {
    print("Error fetching usernames: $e");
    return [];
  }
}
// Future<List<String>> fetchAmount() async {
//   try {
//     QuerySnapshot posts = await FirebaseFirestore.instance.collection('posts').get();
//     List<String> amounts = posts.docs
//         .map((doc) {
//           final postData = doc.data() as Map<String, dynamic>;
//           return postData['amount'] as String;
//         })
//         .toList();
//     return amounts;
//   } catch (e) {
//     print("Error fetching amounts: $e");
//     return [];
//   }
// }


}