import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listNavigate = [
    "/exchange",
    "/fancy",
    '/cricket+exchange',
    '/administration'
  ];
  List listTitle = [
    "Sports Exchange",
    "Fancy Exchange",
    "Cricket + Fancy ",
    "Administration"
  ];
  List listImage = [
    "assets/sport.png",
    "assets/fancy.png",
    "assets/cricket.png",
    "assets/admin.jpeg"
  ];
  List listsubTitle = [
    "Bet Online in Multiple Sports",
    "Bet Online in Fancy with Fancy Exchange",
    "Cricket/Fnacy on Same Screen",
    "Report and  Administration"
  ];
  late NavigationService _navigate;

  final User? user = FirebaseAuth.instance.currentUser;

  Future<String?> getroll() async{
  
         String uid = user!.uid;

    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    String role = userDoc.get('role');
    return role;

   
    }
  
 

  @override
  Widget build(BuildContext context)  {
   
  
    
    _navigate = NavigationService();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
           
    return WillPopScope(
      onWillPop: () async{ 
        SystemNavigator.pop();
        return false;
       },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          backgroundColor: AppColors.appBarColor,
          title: Text(
            "Info Reborn New",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body:Column(
          children: [
            Expanded(
              child: FutureBuilder<String?>(
                future: getroll(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    final userRole = snapshot.data;
                      int length;
                      String isUser  ='user';
    
    
                        if(isUser==userRole){
                         length=listTitle.length-1;
                        }
                        else{
                          length=listTitle.length;
                        }
                    return ListView.builder(
                      itemCount: length,
                      itemBuilder: (context, index) {
                        // Check if the user is an admin to display the "Administration" item
                     
    
                        // Conditionally display the item based on the user's role
                     
                          return GestureDetector(
                            onTap: () {
                              _navigate.navigateToRoute(listNavigate[index]);
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: height * 0.18,
                                    width: width * 0.18,
                                    child: Image.asset(listImage[index]),
                                  ),
                                  title: Text(
                                    listTitle[index],
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  subtitle: Text(
                                    listsubTitle[index],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                SizedBox(height: height * 0.006),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey.shade400,
                                  indent: 13,
                                  endIndent: 13,
                                )
                              ],
                            ),
                          );
                        } 
                      
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );

    
  }
}
