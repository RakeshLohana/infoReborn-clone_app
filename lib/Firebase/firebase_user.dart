import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';







// Future<List<Map<String, dynamic>>> fetchUsers() async {
//   try {
//     QuerySnapshot users = await FirebaseFirestore.instance.collection('users').get();
//     return users.docs.map((doc) {
//       Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
//       userData['id'] = doc.id; // Include the document ID in the map
//       return userData;
//     }).toList();
//   } catch (e) {
//     print("Error fetching users: $e");
//     return [];
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<List<Map<String, dynamic>>> fetchUsers() async {
//   try {
//     QuerySnapshot users = await FirebaseFirestore.instance.collection('users').get();
//     List<Map<String, dynamic>> userList = users.docs
//         .map((doc) => doc.data() as Map<String, dynamic>)
//         .where((userData) {
//           // Filter out documents with roles "master" and "admin"
//           final role = userData['role'];
//           return role != 'master' && role != 'admin';
//         })
//         .toList();
//     return userList;
//   } catch (e) {
//     print("Error fetching users: $e");
//     return [];
//   }
// }

Future<List<Map<String, dynamic>>> fetchUsers() async {
  try {
    QuerySnapshot users = await FirebaseFirestore.instance.collection('users').get();
    List<Map<String, dynamic>> userList = users.docs
        .where((doc) {
          final userData = doc.data() as Map<String, dynamic>;
          final role = userData['role'];
          return role != 'master' && role != 'admin';
        })
        .map((doc) {
          final userData = doc.data() as Map<String, dynamic>;
          userData['id'] = doc.id;
          return userData;
        })
        .toList();
    return userList;
  } catch (e) {
    print("Error fetching users: $e");
    return [];
  }
}







    final User? user = FirebaseAuth.instance.currentUser;


  Future<String?> getroll() async{
  
         String uid = user!.uid;

    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    String role = userDoc.get('username');
    return role;

   
    }

    
  
  

  
  
