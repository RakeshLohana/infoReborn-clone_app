import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>?> fetchUsersAndPosts() async {
    try {
      final usersQuery = _firestore.collection('users').get();
      final postsQuery = _firestore.collection('posts').get();

      final results = await Future.wait([usersQuery, postsQuery]);

      final usersData = results[0].docs.map((doc) {
        final userData = doc.data() as Map<String, dynamic>;
        return userData;
      }).toList();

      final postsData = results[1].docs.map((doc) {
        final postData = doc.data() as Map<String, dynamic>;
        return postData;
      }).toList();

      // Combine the data from both collections
      final combinedData = [...usersData, ...postsData];

      return combinedData;
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
}
