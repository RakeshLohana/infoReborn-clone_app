import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/screens/Login/login.dart';
import 'package:bet_app/screens/Register/register.dart';
import 'package:bet_app/screens/administration.dart';
import 'package:bet_app/screens/cricket_plus_fancy.dart';
import 'package:bet_app/screens/fancy_screen.dart';
import 'package:bet_app/screens/home_screen.dart';
import 'package:bet_app/screens/sports_exchange_screen.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/cricket.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/grey.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/horse.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/inplay_events.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/inplay_events_subfiles/soccer.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/inplay_events_subfiles/tennis.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/inplay_soon.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/my_market.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/soccer.dart';
import 'package:bet_app/screens/sports_exchange_subfiles.dart/tennis.dart';
import 'package:bet_app/widgets/Administration/Balance%20Sheet/new.dart';
import 'package:bet_app/widgets/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
   SharedPreferences prefs = await SharedPreferences.getInstance();

  // Check if the unique ID is already stored in shared preferences.
  await Firebase.initializeApp();
      String? uniqueID = prefs.getString('uniqueID');

  runApp( 
    MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
          initialRoute:uniqueID == null? '/register': "/login",
          routes: {
          '/AmountFetchWidget':(BuildContext context) => AmountFetchWidget(),
              '/register':(BuildContext context) => Register(prefs:prefs ,),
             '/login':(BuildContext context) => LoginScreen(uniqueID: uniqueID ,),


           '/administration':(BuildContext context) => Administration(),

              '/menuwidget':(BuildContext context) => MenuWidget(),
          //  '/login':(BuildContext context) => Register(),
            '/home':(BuildContext context) => HomeScreen(),
            '/exchange':(BuildContext context) => SportsExchangeScreen(),
             '/fancy':(BuildContext context) => FancyScreen(),
              '/cricket+exchange':(BuildContext context) => CricketFancy(),
            '/market':(BuildContext context) => MyMarket(),
            "/inplayEve":(BuildContext context) =>InPlayEvents (),
             "/inplay":(BuildContext context) =>InPlaySoon (),
             "/cric":(BuildContext context) =>CricketSub (),
              "/soccerEvent":(BuildContext context) =>SoccerEvent (),
            "/tennisEvent":(BuildContext context) =>TennisEvent (),

               '/soccer':(BuildContext context) =>Soccer (),
              '/tennis':(BuildContext context) =>Tennis (),
               '/horse':(BuildContext context) =>HorseRace(),
              '/grey':(BuildContext context) => GreyHound(),


          },
      debugShowCheckedModeBanner: false,
      title: 'Infor Reborn New',
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        textSelectionTheme:  TextSelectionThemeData(
      cursorColor:Colors.green.shade600
      
    ),
   
   
        colorScheme: ColorScheme.fromSeed(
          primary:  Colors.green.shade600,
          seedColor: Colors.purple),
        useMaterial3: true,
      ),
      // home: HomeScreen(),
    ));}
    
    // MyApp(unique: uniqueID!, prefs: prefs,)



// class MyApp extends StatelessWidget {
//   final SharedPreferences prefs;
//   final String unique;
//   const MyApp({super.key, required this.unique, required this.prefs});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

// );
// }