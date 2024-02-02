import 'package:bet_app/Firebase/auth_helper.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/Utils/flutter_toast.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  final String username;
  const ChangePassword({Key? key, required this.username}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

String? _validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required.';
  }
  return null;
}

String? _validateConfirmPassword(String? value) {
  if (value != _newPassword.text) {
    return 'Passwords do not match.';
  }
  return null;
}




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow, width: 3),
            ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
              child: Column(
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(color: Colors.brown, fontSize: 23),
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Name:  ", style: TextStyle(fontSize: 16)),
                      Text(
                        widget.username,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.04),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.021),
                        child: Text("Old Password: "),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            controller: _oldPassword,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.021),
                        child: Text("New Password: "),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            controller: _newPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                            validator: _validatePassword,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.04),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.021),
                        child: Text("Confirm Password: "),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            controller: _confirmPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                            validator: _validateConfirmPassword,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.04),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
    
                          AuthHelper().updatePassword(_oldPassword.text, _confirmPassword.text).onError((error, stackTrace) {
                            Toast.showToast(message: "error occured");
                          });
                        }
                        
                      },
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                        ),
                        child: Center(
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
