// import 'package:bet_app/Models/HorseDataResponse1.dart';
// import 'package:bet_app/Models/HorseDataResponse2.dart';
// import 'package:bet_app/Services/services.dart';
// import 'package:flutter/material.dart';



// class HorseDataScreen extends StatefulWidget {


//   final String fi;

//   const HorseDataScreen({super.key, required this.fi});
//   @override
//   _HorseDataScreenState createState() => _HorseDataScreenState();

// }

// class _HorseDataScreenState extends State<HorseDataScreen> {
//   final Services apiService = Services();
//   HorseDataOddsFixed? horseDataFixed;
//   HorseDataOddsWin? horseDataWin;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final dataFixed = await apiService.fetchHorseDataOdds(widget.fi);
//       final dataWin = await apiService.fetchHorseDataWin(widget.fi);

//       setState(() {
//         horseDataFixed = dataFixed;
//         horseDataWin = dataWin;
//       });
//     } catch (e) {
//       // Handle errors here
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Horse Data Example'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           horseDataFixed == null
//               ? CircularProgressIndicator()
//               : Text('Data from HorseDataOddsFixed:'+horseDataFixed!.results[0].main.sp.fixed.odds[1].na.toString() ),

//           horseDataWin == null
//               ? CircularProgressIndicator()
//               : Text('Data from HorseDataOddsWin: ${horseDataWin!.results[0].main.sp. }'),
//           // Add more data from both models as needed
//         ],
//       ),
//     );
//   }
// }
