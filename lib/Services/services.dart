import 'package:bet_app/Models/HorceRacing.dart';
import 'package:bet_app/Models/HorseDataResponse1.dart';
import 'package:bet_app/Models/HorseDataResponse2.dart';
import 'package:bet_app/Models/betfair_event_response.dart';
import 'package:bet_app/Models/upcoming_odds.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:bet_app/Models/sportOdd.dart';
import 'package:bet_app/Models/sportsOdds.dart';
import 'package:dio/dio.dart';

class Services{

Future<List<dynamic>> fetchSportsData() async {
  final String apiUrl = 'https://odds.p.rapidapi.com/v4/sports';

  final dio = Dio();

  // Set the headers for the request
  dio.options.headers.addAll({
    'X-RapidAPI-Key': '4cae67f1b6msh6d0f78b2d847dccp1b768ejsne79e0efa5a16',
    'X-RapidAPI-Host': 'odds.p.rapidapi.com',
  });

  try {
    final response = await dio.get(apiUrl,   queryParameters: {'all': 'true'},
);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return  data;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

Future<List<dynamic>> fetchSportsScores() async {
  final String apiUrl = 'https://odds.p.rapidapi.com/v4/sports/cricket_icc_world_cup/scores';

  final dio = Dio();

  // Set the headers for the request
  dio.options.headers.addAll({
    'X-RapidAPI-Key': '4cae67f1b6msh6d0f78b2d847dccp1b768ejsne79e0efa5a16',
    'X-RapidAPI-Host': 'odds.p.rapidapi.com',
  });

  try {
    final  response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
      final List<dynamic> matches = response.data;
           
      return matches ;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}


Future<List<dynamic>> fetchSportsOdd(String query) async {
  final String apiUrl = 'https://odds.p.rapidapi.com/v4/sports/'+query+'/odds';

  final dio = Dio();
   final Map<String, dynamic> queryParameters = {
    'regions': 'us',
    'oddsFormat': 'decimal',
    'markets': 'h2h,spreads',
    'dateFormat': 'iso',
    'all': 'true'
  };

  // Set the headers for the request
  dio.options.headers.addAll({
    'X-RapidAPI-Key': '4cae67f1b6msh6d0f78b2d847dccp1b768ejsne79e0efa5a16',
    'X-RapidAPI-Host': 'odds.p.rapidapi.com',
  });

  try {
    final response = await dio.get(apiUrl,queryParameters:queryParameters);

    if (response.statusCode == 200) {
     final List<dynamic> data = response.data;
        // final List<SportsOdds> sportsOdds = data
        //     .map((json) => SportsOdds.fromJson(json))
        //     .toList();
        return data;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

Future<List<dynamic>> fetchTennisOdd() async {
  final String apiUrl = 'https://sports-live-scores.p.rapidapi.com/tennis/live';

  final dio = Dio();
;

  // Set the headers for the request
  dio.options.headers.addAll({
    'X-RapidAPI-Key': 'e74ee2701fmsh6322457703a536ep123feejsnbc0e227a56a5',
    'X-RapidAPI-Host': 'sports-live-scores.p.rapidapi.com',
  });

  try {
    final response = await dio.get(apiUrl);

    if (response.statusCode == 200) {
     final Map<String,dynamic> data = response.data;
     final List<dynamic> list=data["matches"];

        return list;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}


// Future<List<SportsOdds?>> fetchSportsOdd(String query) async {
//   final String apiUrl = 'https://odds.p.rapidapi.com/v4/sports/$query/odds';

//   final response = await http.get(Uri.parse(apiUrl), headers: {
//     'X-RapidAPI-Key': 'b88679d899mshc267c95832e0c40p116a1fjsn82c159e7f555',
//     'X-RapidAPI-Host': 'odds.p.rapidapi.com',
//   });

//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     final List<SportsOdds> sportsOdds = data.map((json) {
//       return SportsOdds(
//         id: json['id'],
//         sportKey: json['sport_key'],
//         sportTitle: json['sport_title'],
//         commenceTime: json['commence_time'],
//         homeTeam: json['home_team'],
//         awayTeam: json['away_team'],
//         bookmakers: (json['bookmakers'] as List<dynamic>).map((bookmaker) {
//           return Bookmaker(
//             key: bookmaker['key'],
//             title: bookmaker['title'],
//             lastUpdate: bookmaker['last_update'],
//             markets: (bookmaker['markets'] as List<dynamic>).map((market) {
//               return Market(
//                 key: market['key'],
//                 lastUpdate: market['last_update'],
//                 outcomes: (market['outcomes'] as List<dynamic>).map((outcome) {
//                   return Outcome(
//                     name: outcome['name'],
//                     price: outcome['price'].toDouble(),
//                   );
//                 }).toList(),
//               );
//             }).toList(),
//           );
//         }).toList(),
//       );
//     }).toList();
//     return sportsOdds;
//   } else {
//     throw Exception('Request failed with status: ${response.statusCode}');
//   }
// }


final Dio _dio = Dio();

  final String baseUrl = 'https://api.b365api.com/v1/betfair/ex/upcoming?';

  Future<UpcomingEvent> getUpcomingEvents() async {
    try {
      final response = await _dio.get(baseUrl, queryParameters: {
        'sport_id': '4',
        'token': '174934-G2BfmL0xkgBnUk',
      });
      if (response.statusCode == 200) {
        return UpcomingEvent.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }



 final String apiUrl = 'https://api.b365api.com/v1/betfair/ex/event';

  Future<Welcome> fetchBetfairData(String token, int eventId) async {
    final response = await http.get(
      Uri.parse('$apiUrl?token=$token&event_id=$eventId'),
    );

    if (response.statusCode == 200) {
      final parsedData = json.decode(response.body);
      return Welcome.fromJson(parsedData);
    } else {
      throw Exception('Failed to load data from Betfair API');
    }
  }



  Future<HorseRacing> fetchHorseRacingData(String sportId,) async {
  final dio = Dio();
  final url = "https://api.b365api.com/v1/bet365/upcoming";

  try {
    final response = await dio.get(
      url,
      queryParameters: {
        "sport_id": sportId,
        "token": "174934-G2BfmL0xkgBnUk",
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON response using your model class
      final horseRacing = horseRacingFromJson(jsonEncode(response.data));
      return horseRacing;
    } else {
      throw Exception("Failed to fetch data");
    }
  } catch (e) {
    throw Exception("Error: $e");
  }

  }

//   Future<HorseData> fetchHorseData( String fi) async {
//   final dio = Dio();
//   final url = "https://api.b365api.com/v3/bet365/prematch?";

//   try {
//     final response = await dio.get(
//       url,
//       queryParameters: {
//         "token": "174934-G2BfmL0xkgBnUk",
//         "FI": fi,
//       },
//     );

//     if (response.statusCode == 200) {
//       // Parse the JSON response using your model class
//       final horseData = horseDataFromJson(jsonEncode(response.data));
//       return horseData;
//     } else {
//       throw Exception("Failed to fetch data");
//     }
//   } catch (e) {
//     throw Exception("Error: $e");
//   }
// }


// Future<HorseDataOdds?> fetchHorseOdds(String fi) async {
//   final dio = Dio();
//   final url = "https://api.b365api.com/v3/bet365/prematch?token=174934-G2BfmL0xkgBnUk&FI="+fi;

//   try {
//     final response = await dio.get(
//       url,
//       // queryParameters: {
//       //   "token": "174934-G2BfmL0xkgBnUk",
//       //   "FI": fi,
//       // },
//     );

//     if (response.statusCode == 200) {
//       if (response.data != null) {
//         // Parse the JSON response using your model class
//         final horseData = horseDataFromJson(jsonEncode(response.data));
//         return horseData;
//       } else {
//         throw Exception("Response is null");
//       }
//     } else {
//       throw Exception("Failed to fetch data");
//     }
//   } catch (e) {
//     throw Exception("Error: $e");
//   }
// }

 Future<HorseDataOddsFixed> fetchHorseDataOdds(String fi) async {
      final Dio dio = Dio();
  final String baseUrl = 'https://api.b365api.com/v3/bet365/prematch?token=174934-G2BfmL0xkgBnUk&FI='+fi;
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        return HorseDataOddsFixed.fromJson(response.data);
      } else {
        throw Exception('Failed to load horse data odds');
      }
    } catch (e) {
      throw Exception('Failed to load horse data odds: $e');
    }
  }




Future<HorseRaceWin?> fetchHorseRaceWin(String fi) async {
  final dio = Dio();
  try {
    final response = await dio.get('https://api.b365api.com/v3/bet365/prematch?token=174934-G2BfmL0xkgBnUk&FI='+fi);
    if (response.statusCode == 200) {
      return HorseRaceWin.fromJson(response.data);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}


  




// Future<HorseRaceResponse> fetchData(String fi) async {
//   final dio = Dio();
//   final response = await dio.get('https://api.b365api.com/v3/bet365/prematch?token=174934-G2BfmL0xkgBnUk&FI='+fi); // Replace with your API endpoint

//   if (response.statusCode == 200) {
//     final data = HorseRaceResponse.fromJson(response.data);

//     // Now you can access the data
//     print(data.results[0].main.odds[0].NA); // Example usage
//   } else {
//     // Handle error
//     print('Failed to load data');
//   }
// }


}



