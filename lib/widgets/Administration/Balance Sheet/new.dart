// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AmountFetchWidget extends StatefulWidget {
  @override
  _AmountFetchWidgetState createState() => _AmountFetchWidgetState();
}

class _AmountFetchWidgetState extends State<AmountFetchWidget> {
  String? userEmail = FirebaseAuth.instance.currentUser!.email;
  String? username;
  String? userAmount;
  TextEditingController _controller = TextEditingController();



 Future<void> fetchUserAmount() async {
  if (userEmail != null) {
    username = userEmail;
  } else {
    // Handle the case where userEmail is null
  }

  try {
    QuerySnapshot postQuery = await FirebaseFirestore.instance
        .collection('posts')
        .where('username', isEqualTo: username)
        .get();

    double totalAmount = 0.0;

    postQuery.docs.forEach((doc) {
      final postData = doc.data() as Map<String, dynamic>;
      final amount = double.tryParse(postData['amount'] ?? '0.0'); // Convert to double
      totalAmount += amount!;
    });

    setState(() {
      userAmount = totalAmount.toStringAsFixed(2); // Update the userAmount variable as a formatted string
    });
  } catch (e) {
    print("Error fetching amount for user: $e");
    // Handle the error, e.g., show an error message
  }
}

 Future<void> updateAmountInFirestore(double newAmount) async {
  try {
    QuerySnapshot postQuery = await FirebaseFirestore.instance
        .collection('posts')
        .where('username', isEqualTo: username)
        .get();

    String docId = '';

    postQuery.docs.forEach((doc) {
      docId = doc.id;
    });

    // Subtract the amount from userAmount and convert it to a string
    String updatedAmount = (double.parse(userAmount!) - newAmount).toString();

    await FirebaseFirestore.instance.collection('posts').doc(docId).update({
      'amount': updatedAmount,
    });

    // Fetch the updated amount
    fetchUserAmount();
  } catch (e) {
    print("Error updating amount in Firestore: $e");
    // Handle the error, e.g., show an error message
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amount Fetch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total Amount for User: ' + userAmount.toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Replace 600 with the amount you want to subtract
                updateAmountInFirestore(double.parse(_controller.text));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 50,
                width: 50,
                color: Colors.grey.shade400,
                child: Center(
                    child: Text("-600",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 100,
              width: 100,
              color: Colors.white,
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => fetchUserAmount(),
              child: Text('Fetch User Amount'),
            ),
          ],
        ),
      ),
    );
  }
}



// class AmountFetchWidget extends StatefulWidget {
//   @override
//   _AmountFetchWidgetState createState() => _AmountFetchWidgetState();
// }

// class _AmountFetchWidgetState extends State<AmountFetchWidget> {
//  String? userEmail = FirebaseAuth.instance.currentUser!.email;
// String? username;   // Replace with the actual username of the current user
//   String? userAmount ; // Variable to store the fetched amount
//     TextEditingController _controller=TextEditingController();




//   Future<void> fetchUserAmount() async {
    
//   if (userEmail != null) {
//   username = userEmail;
// } else {

// }
//     try {
//       QuerySnapshot postQuery = await FirebaseFirestore.instance
//           .collection('posts')
//           .where('username', isEqualTo: username)
//           .get();

//       String? totalAmount ;

//       postQuery.docs.forEach((doc) {
//         final postData = doc.data() as Map<String, dynamic>;
//         final amount = postData['amount'];
//         totalAmount = amount;
//       });

//       setState(() {
//         userAmount = totalAmount; // Update the userAmount variable
//       });
//     } catch (e) {
//       print("Error fetching amount for user: $e");
//       // Handle the error, e.g., show an error message
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Amount Fetch'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Total Amount for User: '+userAmount.toString(),
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//                            onTap: (){
//                             _controller.text="600";
                          
//                           },
//                           child: Container(
//                            margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
//                             height: 50,
//                             width: 50,
//                             color: Colors.grey.shade400,
//                             child: Center(
//                                 child: Text("+600",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold))),
//                           ),
//                         ),
//              Container(
               
//                margin: EdgeInsets.all(10),

//                height:100,
//                width: 100,
//                color: Colors.white,
//                child: TextFormField(
//                  style: TextStyle(fontSize: 15),
//                  controller: _controller,
//                  keyboardType: TextInputType.number,
//                  decoration: InputDecoration(
//                        border: InputBorder.none,

               
//                    filled: true,
//                    fillColor: Colors.white,
                   
//                  ),
                             
                
//                ),
//              ),
//             ElevatedButton(
//               onPressed: () => fetchUserAmount(),
//               child: Text('Fetch User Amount'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
