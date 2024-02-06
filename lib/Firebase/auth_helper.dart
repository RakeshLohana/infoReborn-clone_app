import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Utils/flutter_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper{

    late NavigationService _navigate= NavigationService();





bool isUsernameValid(String username) {
  // Define a regular expression to match a simple username (letters, numbers, and underscores)
  RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');

  // Check if the input matches the username format
  return usernameRegex.hasMatch(username);
}

// Register a new user and assign a role
Future<void> registerUserWithUsername(String username, String password,String role) async {
  try {
    String email = username+"@gmail.com"; // You can customize the domain here

    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    String uid = userCredential.user!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': email,
      'role': role,
      'username': username, // Store the username separately if needed
    }).then((value) {
      //  Toast.showToast(message: "New User Added");

    }).onError((error, stackTrace) {
                                        //  Toast.showToast(message: "Error occured while adding user");



        });;
  } catch (e) {
    print(e.toString());
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email+"@gmail.com", password: password).then((value) {
        _navigate.navigateToRoute("/home");
        // Toast.showToast(message: "Login Successful");

      }).onError((error, stackTrace){
        //  Toast.showToast(message: "error occured");

      });
      
    } catch (e) {
      print(e.toString());
    }
  }




Future<void> updatePassword(String oldPassword, String newPassword) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reauthenticate the user with their old password
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );

      await user.reauthenticateWithCredential(credential).onError((error, stackTrace) {
        // Toast.showToast(message: "error occured");
       throw Exception(error.toString());

       
      });

      // Update the password
      await user.updatePassword(newPassword).then((value) {
        // Toast.showToast(message: "Password changed successfully");
      });
      print("Password updated successfully");
    } else {
      print("No user is currently signed in.");
    }
  } catch (e) {
    print("Error updating password: $e");
    // You can handle the error and provide user feedback here.
  }
}




  // Future<void> loginUsingEmailAndPassword(
  //     String _email, String _password) async {
  //   try {
  //     await _auth
  //         .signInWithEmailAndPassword(email: _email+"@gmail.co", password: _password)
  //         .then((value) {
  //       print("Login Sucess!");
  //     });
  //   } on FirebaseAuthException {
  //     print('Error logging in to Firebase');
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

// User logout
void logoutUser() {
  FirebaseAuth.instance.signOut();
}



}