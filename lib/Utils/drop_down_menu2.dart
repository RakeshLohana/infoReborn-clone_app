import 'package:bet_app/Firebase/firebase_user.dart';
import 'package:flutter/material.dart';

class DropDownMenu2 extends StatefulWidget {
  const DropDownMenu2({super.key});

  @override
  State<DropDownMenu2> createState() => _DropDownMenu2State();
}

class _DropDownMenu2State extends State<DropDownMenu2> {

    List<Map<String, dynamic>> _jsonMap = [];
  


  @override
  void initState() {
    super.initState();
    fetchUsers().then((users) {
      setState(() {
        _jsonMap = users;
      });
    });
  }


 String? _selected;


  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          hint: Row(
            children: [
           
            Text("Select user"),
    
            ],
          ),
          value: _selected,
          onChanged: (newValue){
            setState(() {
         _selected=newValue ;
    
              
    
            });
    
    
          } ,
          items:_jsonMap.map((item) {
            return DropdownMenuItem(
  value: item["id"].toString(),
  child: Row(
    children: [
    Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        width: 70, // Set a fixed width of 80 pixels
        child: Text(
          item["username"],
          maxLines: 1, // Set the maximum number of lines
          overflow: TextOverflow.ellipsis, // Add an ellipsis (...) if text overflows
        ),
      ),
    ),
    ],
  ),
);
          }).toList()
          )),);
  }
}