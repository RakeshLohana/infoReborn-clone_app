import 'package:bet_app/Firebase/auth_helper.dart';
import 'package:bet_app/Services/navigation_service.dart';
import 'package:bet_app/Utils/color_constants.dart';
import 'package:bet_app/Utils/dropdown.dart';
import 'package:bet_app/Utils/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';

class LoginScreen extends StatefulWidget {
    final String? uniqueID;

  // final TextEditingController data;
  const LoginScreen({super.key, required this.uniqueID, });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  late NavigationService _navigate;
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    _navigate = NavigationService();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          title: Text(
            "InfoReborn New",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
              
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
            //  "Dear " + "rakesh" + " Welcome to the InfoReborn New",

                  "Dear " + widget.uniqueID.toString() + " Welcome to the InfoReborn New",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          "login To:  ",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )),
                        Expanded(flex: 3, child: DropDownMenu()),
                        // Expanded(
                        //   flex: 2,
                        //   child: Image.asset("assets/logo.jpeg",height: 100,)),
                        // Expanded(
                        //   flex: 1,
                        //   child: Text("InfoReborn New",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),))
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.021),
                          child: Text("User Name: "),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,),
                            child: TextFormField(
                              style: TextStyle(
                                
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              controller: _username,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                isDense: true
                                
                            
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.021),
                          child: Text("Password: "),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                isDense: true
                                
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Remember Password"),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value;
                                });
                              }),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (_username.text.isEmpty ||
                                  _password.text.isEmpty) {
                                Toast.showToast(
                                    message:
                                        "Username and password cannot be empty");
                                return; // Return to prevent further execution
                              }

                              if (!AuthHelper().isUsernameValid(_username.text)) {
                                Toast.showToast(
                                    message: "Invalid username format");
                                return; // Return to prevent further execution
                              }

                              try {
                               AuthHelper().signInWithEmailAndPassword
                              (_username.text, _password.text);
                              
                             
                              } catch (e) {
                                print(e.toString());
                                Toast.showToast(message: "An error occurred");
                              }
                            },
                            child: Container(
                              width: width * 0.2,
                              height: height * 0.05,
                              decoration:
                                  BoxDecoration(color: AppColors.buttonColor),
                              child: Center(
                                  child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              )),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                      "Welcome to InfoReborn New (By Pressing Login Button You are Accepting the Terms and Conditions provided by InfoReborn New)"),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      decoration: BoxDecoration(color: AppColors.versionColor),
                      child: Text(
                        "version = 192.1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
