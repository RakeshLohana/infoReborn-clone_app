import 'package:bet_app/Firebase/firebase_user.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/Utils/dropdown.dart';
import 'package:bet_app/widgets/Administration/account_ledger.dart';
import 'package:bet_app/widgets/Administration/balance_sheet.dart';
import 'package:bet_app/widgets/Administration/change_password.dart';
import 'package:bet_app/widgets/Administration/new_account.dart';
import 'package:bet_app/widgets/Administration/trans_minus_screen.dart';
import 'package:bet_app/widgets/Administration/trans_plus_screen.dart';
import 'package:flutter/material.dart';



class TapBar extends StatefulWidget {
  const TapBar({super.key});

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {

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
  @override
  Widget build(BuildContext context) {
     Color grey=Colors.grey;

    return 
   DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
      isScrollable: true,
      labelColor:grey,
      unselectedLabelColor:grey,
      dividerColor:grey,
      indicatorColor:Colors.green,
      labelPadding: EdgeInsets.symmetric(horizontal: 10.0),

      tabs: const [
        Tab(text: "ACCOUNT\nLEDGER",),
      
                Tab(text: "PASSWORD\nCHANGE",),
              
                Tab(text: "NEW ACCOUNT",),
                 Tab(text: "BALANCE SHEET",),
                  Tab(text: "TRANS.PLUS",),
                  
                    
                   Tab(text: "TRANS.MINUS",),
      ],
    ),
          
              
        backgroundColor:AppColors.appBarColor ,
           automaticallyImplyLeading: false,
        title: Text("InfoReborn",style: TextStyle(color: Colors.white),),),
        
       
          body:  TabBarView(
            children: [
              AccountLedgerScreen(),
          ChangePassword(username: firebase_username!,),
            NewAccount(username: firebase_username!,),
         BalanceSheetScreen(),
          TransPlusScreen(),
        TransMinusScreen(),

            ],
          ),
        ),
      );
   
  }
}


















