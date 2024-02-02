import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {

 String? _selected;
 List<Map>_jsonMap=[
  {
    "id":'1',
    "image":"assets/logo.jpeg",
    "name":"InfoMagic New"

  },
  //   {
  //   "id":'2',
  //   "image":"assets/skyExch.jpeg",
  //   "name":"skyExchange"

  // },
  //    {
  //   "id":'3',
  //   "image":"assets/sunrise.jpeg",
  //   "name":"Sunrise"

  // },
  //      {
  //   "id":'4',
  //   "image":"assets/VictoryBet.jpeg",
  //   "name":"VictoryBet"

  // },
      {
    "id":'2',
    "image":"assets/AddNew.jpeg",
    "name":"Add Exchange"

  },
 ];


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
              Image.asset("assets/logo.jpeg",width: width*0.07,),
              SizedBox(width: width*0.05,),
           
            Text("InfoMagic New")

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
                  Image.asset(item["image"],width: width*0.1,),
                  SizedBox(width: width*0.05,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(item["name"]),
                  )
                ],
              ));
          }).toList()
          )),);
  }
}