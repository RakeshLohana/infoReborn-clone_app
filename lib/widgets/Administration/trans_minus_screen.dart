import 'package:bet_app/Firebase/firebase_user.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/Utils/flutter_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransMinusScreen extends StatefulWidget {
  const TransMinusScreen({super.key});

  @override
  State<TransMinusScreen> createState() => _TransMinusScreenState();


}



class _TransMinusScreenState extends State<TransMinusScreen> {
   final TextEditingController _amountController=TextEditingController();

    final TextEditingController _descriptionController=TextEditingController();
           bool isPlusCrChecked = false;
           bool creditCheck=false;


// Define a variable to store the amount
String userAmount = "";
String userAmountCredit = "";


// Function to fetch the user's amount from Firestore
Future<void> fetchUserAmount(String? userId) async {
  try {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('posts').doc(userId).get();
     DocumentSnapshot userDoc2 = await FirebaseFirestore.instance.collection('postsCredit').doc(userId).get();

    if (userDoc.exists || userDoc2.exists) {
      // Check if the user document exists
      userAmount = userDoc.get('amount').toString();
      userAmountCredit = userDoc2.get('creditAmount').toString();

    } else {
      // Handle the case where the user document doesn't exist
      userAmount = "0";
    userAmountCredit = "0";

    }
    setState(() {
   firebase_amount = userAmount;
   firebase_creditAmount=userAmountCredit;

      // Update the UI to display the fetched amount
    });
  } catch (e) {
    print("Error fetching user amount: $e");
    // Handle the error, e.g., show an error message
  }
}


              List<Map<String, dynamic>> _jsonMap = [];
  
   String? firebase_amount;
   String? firebase_creditAmount;

  



  @override
  void initState() {
    super.initState();

    fetchUsers().then((users) {
      setState(() {
        _jsonMap = users;
      });
    });
  }


 String? _selectedUserId;
 


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(

      
      body: SingleChildScrollView(
        
        child: Container(
          height: height,
           decoration: BoxDecoration(
            color: Colors.pink.shade200
           ),
      
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
            child: Column(
              
              children: [
                // Name TextField
                   SizedBox(height: height*0.05,),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    
          
                        children: [
                          Expanded(child: Text("Accont Name:  ",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),)),
                           Expanded(
                          flex: 2,
                          child: DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          hint: Row(
            children: [
           
            Text("Select user"),
    
            ],
          ),
          value: _selectedUserId,
          onChanged: (newValue){
            setState(() {
         _selectedUserId=newValue ;
         fetchUserAmount(_selectedUserId);
       
    
              
    
            });
    
    
          } ,
          items:_jsonMap.map((item) {
            return DropdownMenuItem(
  value: item["id"].toString(),
  child: Row(
    children: [
    Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        width: 70, // Set a fixed width of 80 pixels
        child: Text(
          item["username"],
          maxLines: 1, // Set the maximum number of lines
          overflow: TextOverflow.ellipsis, // Add an ellipsis (...) if text overflows
        ),
      ),
    ),
    ],
  ),
);
          }).toList()
          )),)),
                          Expanded(child: GestureDetector(
                                               onTap: (){
                                                setState(() {
                                                  fetchUserAmount(_selectedUserId);
                                                  
                                                });
                                      
                                               },
                                               child: Container(
                                   width: width*0.2,
                                  height: height*0.05,
                                             
                                   
                                                 decoration: BoxDecoration(
                                                   color:AppColors.buttonColor
                                                 ),
                                                 child: Center(child: Text("REFRESH",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
                                                   
                                               ),
                                             ), )
                 
                                     ],
                      ),
                   
                
                       
                      SizedBox(height: height*0.02,),
                      Row(
      
          
                        children: [
                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(top: height*0.021),
                              child: Text("Credit:",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),),
                            ),
                          ),
                           Expanded(
                            flex: 2,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10),
                               child:     Padding(
                            padding:  EdgeInsets.only(top: height*0.021),
                            child:firebase_creditAmount!=null ?Text(firebase_creditAmount.toString(),style: TextStyle(fontSize: 16,color: Colors.blue.shade800),):Text("0",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),),
                            ),
                            )
                             ),
                          
                 
                                     ],
                      ),
                       SizedBox(height: height*0.01,),
                    Row(
      
          
                        children: [
                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(top: height*0.021),
                              child: Text("Balance: ",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),),
                            ),
                          ),
                           Expanded(
                            flex: 2,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10),
                               child:     Padding(
                            padding:  EdgeInsets.only(top: height*0.021),
                            child:firebase_amount!=null ? Text(firebase_amount.toString(),style: TextStyle(fontSize: 16,color: Colors.blue.shade800),):Text("0",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),),)
                             ),
                           ),
                 
                                     ],
                      ),
                           Row(
      
          
                        children: [
                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(top: height*0.021),
                              child: Text("Risk: ",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),),
                            ),
                          ),
                           Expanded(
                                flex: 2,
      
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10),
                               child:     Padding(
                            padding:  EdgeInsets.only(top: height*0.021),
                            child: Text("O",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),),)
                             ),
                           ),
                 
                                     ],
                      ),
                           Row(
      
          
                        children: [
                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(top: height*0.021),
                              child: Text("W/Out Risk Bal: ",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),),
                            ),
                          ),
                           Expanded(
                            flex: 2,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10),
                               child:     Padding(
                            padding:  EdgeInsets.only(top: height*0.021),
                            child: Text("O",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),),)
                             ),
                           ),
                 
                                     ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.041),
                            child: Text("Amount: ",style: TextStyle(fontSize: 16,color: Colors.blue.shade800)),
                          ),
                           Expanded(
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10),
                               child: TextFormField(
                                           style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                           controller: _amountController,
                                           decoration: InputDecoration(
                                              isDense: true,
                                            contentPadding:EdgeInsets.zero
                                           
                                             
                                           ),
                                           
                                           
                                         ),
                             ),
                           ),
                 
                                     ],
                      ),
                         Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.041),
                            child: Text("Description: ",style: TextStyle(fontSize: 16,color: Colors.blue.shade800),),
                          ),
                           Expanded(
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10),
                               child: TextFormField(
                                           style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                           controller: _descriptionController,
                                           decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:EdgeInsets.zero
                                           
                                             
                                           ),
                                           
                                           
                                         ),
                             ),
                           ),
                 
                                     ],
                      ),
                      SizedBox(height: height*0.04,),
                  
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                          Expanded(
                            flex: 3,
                            child: buildCheckBoxRow("is Credit Entry (Awaaz/Limit) ", isPlusCrChecked, (value) {
                            setState(() {
                              isPlusCrChecked = value!;
                              creditCheck=value;

                            });
                                                }),
                          ),
      
                           Expanded(
                             child: GestureDetector(
                                               onTap: (){
                                                if(creditCheck){
                                                  subtractAmountFromFirestoreCredit();


                                                }
                                                else{
                                              subtractAmountFromFirestore();


                                                }
                                      
                                               },
                                               child: Container(
                                   width: width*0.2,
                                  height: height*0.05,
                                             
                                   
                                                 decoration: BoxDecoration(
                                                   color:AppColors.buttonColor
                                                 ),
                                                 child: Center(child: Text("POST MINUS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)),
                                                   
                                               ),
                                             ),
                           ),
                         ],
                       ),
      
          
                          
              ],
            ),
          ),
        ),
      )
    );
  }  

  Future<void> subtractAmountFromFirestore() async {
  // Get the entered values
  String description = _descriptionController.text;
  
  if (_selectedUserId != null) {
    // Fetch the user's current amount from Firestore
    DocumentReference userRef = FirebaseFirestore.instance.collection('posts').doc(_selectedUserId);
    DocumentSnapshot userData = await userRef.get();
    
    if (userData.exists) {
      // Subtract the entered amount
      String existingAmount = userData.get('amount').toString();
      int currentAmount = int.parse(existingAmount);
      int amountToSubtract = int.parse(_amountController.text);
      int newAmount = currentAmount - amountToSubtract;
      
      if (newAmount >= 0) {
        // Update the user's amount in Firestore
        await userRef.update({
          'amount': newAmount,
          'description': description,
        }).then((value) {
            //  Toast.showToast(message: "Hawala Added Successfully");

        });
        // Clear the input fields
        _amountController.clear();
        _descriptionController.clear();
        // Optionally, you can reset the selected user as well
        // setState(() {
        //   _selectedUserId = null;
        // });
        // Show a success message or navigate to a different screen
      } else {
        // Handle the case where the user's amount becomes negative
        // Show an error message or alert the user
      }
    } else {
      // Handle the case where the user data does not exist
      // Show an error message or alert the user
    }
  } else {
    // Handle the case where a user is not selected
    // Show an error message or alert the user
  }
}

  Future<void> subtractAmountFromFirestoreCredit() async {
  // Get the entered values
  String description = _descriptionController.text;
  
  if (_selectedUserId != null) {
    // Fetch the user's current amount from Firestore
    DocumentReference userRef = FirebaseFirestore.instance.collection('postsCredit').doc(_selectedUserId);
    DocumentSnapshot userData = await userRef.get();
    
    if (userData.exists) {
      // Subtract the entered amount
      String existingAmount = userData.get('creditAmount').toString();
      int currentAmount = int.parse(existingAmount);
      int amountToSubtract = int.parse(_amountController.text);
      int newAmount = currentAmount - amountToSubtract;
      
      if (newAmount >= 0) {
        // Update the user's amount in Firestore
        await userRef.update({
          'creditAmount': newAmount,
          'description': description,
        }).then((value) {
          // Toast.showToast(message: "Hawala Added Successfully");
        }
        
        
        );
        // Clear the input fields
        _amountController.clear();
        _descriptionController.clear();
        // Optionally, you can reset the selected user as well
        // setState(() {
        //   _selectedUserId = null;
        // });
        // Show a success message or navigate to a different screen
      } else {
        // Handle the case where the user's amount becomes negative
        // Show an error message or alert the user
      }
    } else {
      // Handle the case where the user data does not exist
      // Show an error message or alert the user
    }
  } else {
    // Handle the case where a user is not selected
    // Show an error message or alert the user
  }
}


  Widget buildCheckBoxRow(String text, bool isChecked, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(value: isChecked, onChanged: onChanged),
        Text(text,style: TextStyle(fontSize: 12,color: Colors.blue.shade800),),
      ],
    );
  }
}