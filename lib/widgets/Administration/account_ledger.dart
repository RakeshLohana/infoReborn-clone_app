import 'package:bet_app/Utils/drop_down_menu2.dart';
import 'package:bet_app/widgets/Administration/Ledger/ledger_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountLedgerScreen extends StatefulWidget {
  const AccountLedgerScreen({super.key});

  @override
  _AccountLedgerScreenState createState() => _AccountLedgerScreenState();
}

class _AccountLedgerScreenState extends State<AccountLedgerScreen> {
  bool isPlusCrChecked = false;
  bool isWithoutRiskChecked = false;
  bool isOldChecked = false;
  bool isIWithLChecked = false;
       bool textClicked1=false;
  bool textClicked2=false;
  bool sheet=false;
     

 

  @override
  Widget build(BuildContext context) {
      double height=MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;


     var now = new DateTime.now();
    var formatter = new DateFormat('MM/dd/yyyy');
    String formattedDate = formatter.format(now);
    return Container(

      decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 3)),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 241, 228),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    
                 Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                 
                                    setState(() {
                                      textClicked1=true;
                                      textClicked2=false;
                                    });
                                
                    
                                },
                                child: Text(formattedDate,style: TextStyle(decoration:  TextDecoration.underline,decorationColor: textClicked1==true? Colors.green:Colors.grey, ),)),
                              SizedBox(width: 5,),
                              GestureDetector(
                                onTap: (){
                                   
                                    setState(() {
                                      textClicked2=true;
                                      textClicked1=false;
                                    });
                              
                    
                                },
                                
                                child: Text(formattedDate,style: TextStyle(decoration: TextDecoration.underline,              decorationColor : textClicked2==true? Colors.green:Colors.grey))),
                            ],
                          ),
                          DropDownMenu2(),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                          sheet=!sheet;

                                
                              });
                            },
                            child: Image.asset("assets/button.png",height: height*0.05,))
                        ],
                      ),
                    ),
                    // Second Row with Check List in a Row
                    Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Row(
                        children: [
                          buildCheckBoxRow("Plus Cr", isPlusCrChecked, (value) {
                            setState(() {
                              isPlusCrChecked = value!;
                            });
                          }),
                          buildCheckBoxRow("W/O. Risk", isWithoutRiskChecked, (value) {
                            setState(() {
                              isWithoutRiskChecked = value!;
                            });
                          }),
                          buildCheckBoxRow("+Old", isOldChecked, (value) {
                            setState(() {
                              isOldChecked = value!;
                            });
                          }),
                          buildCheckBoxRow("I+W/L", isIWithLChecked, (value) {
                            setState(() {
                              isIWithLChecked = value!;
                            });
                          }),
                        ],
                      ),
                    ),
                  ],
                  
                ), 
                if(sheet)
                LedgerWidget()
              ],
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