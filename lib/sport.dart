import 'package:bet_app/Services/services.dart';
import 'package:flutter/material.dart';


class SportAPI extends StatefulWidget {
  
  const SportAPI({super.key});

  @override
  State<SportAPI> createState() => _SportAPIState();
}

class _SportAPIState extends State<SportAPI> {
  
  @override
  Widget build(BuildContext context) {
    Services serv=Services();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<dynamic>>(
            future:serv.fetchSportsData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator()); // Loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<dynamic> data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index]['group']),
              subtitle: Text(data[index]['key']),
            );
                  },
                );
              }
            },
          ),
          )

          
  

        ],
      ),
    );
  }
}