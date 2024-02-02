import 'package:bet_app/Firebase/firebase_user.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/widgets/Administration/Balance%20Sheet/new.dart';
import 'package:bet_app/widgets/Administration/balance_sheet_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceSheetScreen extends StatefulWidget {
  const BalanceSheetScreen({super.key});

  @override
  State<BalanceSheetScreen> createState() => _BalanceSheetScreenState();
}

class _BalanceSheetScreenState extends State<BalanceSheetScreen> {
 bool isPlusCrChecked = false;

  bool isWithoutRiskChecked = false;
   

  
 
  
         String? firebase_username; // Declare userRole as an instance variable


      Future<void> fetchUserRole() async {
    try {
      final role = await getroll();
      setState(() {
        firebase_username = role; // Assign the role to the instance variable
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
 // 

  bool isOldChecked = false;

  bool isIWithLChecked = false;
  bool sheet=false;

  @override
  Widget build(BuildContext context) {
      double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
        final String formattedDate = DateFormat.yMd().format(DateTime.now());

    return Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 3)),

      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
                          color: Color.fromARGB(255, 243, 241, 228),


            child: Container(

              child: Column(
                children: [
                  Container(
                                              color: Colors.white,


                    child: Column(
                      children: [
                    
                     Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(formattedDate.toString()),
                                ],
                              ),
                              Text(firebase_username.toString(),style: TextStyle(color: Colors.purple),),
                              Align(
                                  alignment: Alignment.bottomRight,
                                   child: GestureDetector(
                                                     onTap: (){
                                                      setState(() {
                                                        sheet=!sheet;
                                                      });
                                            
                                                     },
                                                     child: Container(
                                         width: width*0.2,
                                        height: height*0.05,
                                                   
                                         
                                                       decoration: BoxDecoration(
                                                         color:AppColors.buttonColor
                                                       ),
                                                       child: Center(child: Text("PREPARE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
                                                         
                                                     ),
                                                   ),
                                 ),
                            ],
                          ),
                        ),
                        // Second Row with Check List in a Row
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              buildCheckBoxRow("WithCR", isPlusCrChecked, (value) {
                                setState(() {
                                  isPlusCrChecked = value!;
                                });
                              }),
                              buildCheckBoxRow("W/O. Risk", isWithoutRiskChecked, (value) {
                                setState(() {
                                  isWithoutRiskChecked = value!;
                                });
                              }),
                              buildCheckBoxRow("Dscrd Less 10", isOldChecked, (value) {
                                setState(() {
                                  isOldChecked = value!;
                                });
                              }),
                              
                              
                             
                            ],
                          ),
                        ),
                              
                      ],
                    ),
                  ),
                  if(sheet)
                  BalanceSheetWidget()
            
                ],
            
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckBoxRow(String text, bool isChecked, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(value: isChecked, onChanged: onChanged),
        Text(text,style: TextStyle(fontSize: 10),),
      ],
    );
  }
}