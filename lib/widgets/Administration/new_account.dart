import 'package:bet_app/Firebase/auth_helper.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/Utils/flutter_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewAccount extends StatefulWidget {
  final String username;
  const NewAccount({super.key, required this.username});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
 final TextEditingController _username=TextEditingController();

    final TextEditingController _password=TextEditingController();

  String? userRole;
    final User? user = FirebaseAuth.instance.currentUser;


  Future<String?> getroll() async{
  
         String uid = user!.uid;

    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    String role = userDoc.get('role');
    return role;

   
    }
  
  Future<void> fetchUserRole() async {
    try {
      final role = await getroll();
      setState(() {
        userRole = role; // Assign the role to the instance variable
      });
    } catch (e) {
      print(e.toString());
    }
  }
  

  @override
  void initState() {
    super.initState();
    fetchUserRole(); // Call the function to fetch the user role
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;

  


  
    return Scaffold(
      
      
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.yellow,width: 3)
      ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
          child: Column(
            
            children: [
              // Name TextField
                 Text("Create New Account",style: TextStyle(color:Colors.brown,fontSize: 23, ),),
                 SizedBox(height: height*0.05,),
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  
        
                      children: [
                        Text("Parent Name:  ",style: TextStyle(fontSize: 16 ),),
                         Text(widget.username,style: TextStyle(color:Colors.red,fontSize: 16 ),),
               
                                   ],
                    ),
                 
              
                     
                   
                     SizedBox(height: height*0.03,),
        
                      Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: height*0.021),
                          child: Text("New User: "),
                        ),
                         Expanded(
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: TextFormField(
                                         controller: _username,
                                         style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                                         decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                isDense: true
                                
                                         
                                           
                                         ),
                                         
                                         
                                       ),
                           ),
                         ),
               
                                   ],
                    ),
                    SizedBox(height: height*0.04,),
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: height*0.021),
                          child: Text("Password: "),
                        ),
                         Expanded(
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: TextFormField(
                                         style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),

                                         controller: _password,
                                         obscureText: true,
                                         decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                isDense: true
                                
                                         
                                           
                                         ),
                                         
                                         
                                       ),
                           ),
                         ),
               
                                   ],
                    ),
                    SizedBox(height: height*0.04,),
                
                     Align(
                      alignment: Alignment.bottomRight,
                       child: GestureDetector(
                                         onTap: (){
                                          if(_username.text.isEmpty||_password.text.isEmpty){
                                            Toast.showToast(message: "username and password cannot be empty");

                                          }
                                           if (!AuthHelper().isUsernameValid(_username.text)) {
                                        Toast.showToast(message: "Invalid username format");
                               return;
                                     }
                                          try{
                                            String role;
                                            if(userRole=="admin"){
                                              role="master";
                                              
                                            }
                                            else{
                                              role="user";

                                            }
                                            final user=AuthHelper().registerUserWithUsername (_username.text, _password.text, role);
                                            if(user!=null){
                                              print("register successful"); 
                                            }



                                          } catch(e){
                                            print(e.toString());
                                          }
                                        


                                
                                         },
                                         child: Container(
                             width: width*0.2,
                            height: height*0.05,
                                       
                             
                                           decoration: BoxDecoration(
                                             color:AppColors.buttonColor
                                           ),
                                           child: Center(child: Text("CREATE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
                                             
                                         ),
                                       ),
                     ),
                        
            ],
          ),
        ),
      ),
    );
}
}