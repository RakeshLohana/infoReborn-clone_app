import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/screens/Login/login.dart';
import 'package:bet_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  final SharedPreferences prefs;


   Register({super.key, required this.prefs});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


      TextEditingController idController = TextEditingController();

  void saveUniqueID(BuildContext context) {
    // Get the unique ID from the text field.
    String uniqueID = idController.text;

    // Save the unique ID in shared preferences.
    widget.prefs.setString('uniqueID', uniqueID);

    // Navigate to the home screen.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(uniqueID: uniqueID),
      ),
    );
  }



    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    
    
    double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
       appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text(
          "InfoReborn New",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
      
          children: [
            SizedBox(height: height*0.04,),
            Text("Please Enter Your Id ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        
                       SizedBox(height: height*0.04,),

            Form(
              key: _formKey,
              child: TextFormField(
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
                controller: idController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter ID";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true
                  
                
                  
                ),
                
                
              ),
            ),
            SizedBox(height: height*0.03,),
      
            GestureDetector(
              onTap: (){
                if(_formKey.currentState!.validate()){

                  saveUniqueID(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(data: _register)));


                }

              },
              child: Container(
                       width: width*0.3,
                      height: height*0.06,
            
                       
                decoration: BoxDecoration(
                  color:AppColors.buttonColor
                ),
                child: Center(child: Text("CONNECT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
                  
              ),
            ),
           SizedBox(height: height*0.03,),
      
        
      
             Align(
              alignment: Alignment.centerLeft,
               child: Container(
                decoration: BoxDecoration(color:AppColors.versionColor),
                child: Text("version = 192.1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
             )
      
      
          ],
        ),
      ),
    );
  }
}