import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';




String designatioids = "";
class DesignationDropdown extends StatefulWidget {
  const DesignationDropdown({Key? key}) : super(key: key);

  @override
  _DesignationDropdownState createState() => _DesignationDropdownState();
}

class _DesignationDropdownState extends State<DesignationDropdown> {
  Map categoryItemlist ={};
  List Cate =[];

  Future getAllCategory() async {


    http.Response response = await http.get(Uri.parse('https://pgsedu.com/EduPro/index.php/api/category'), headers: <String, String>{
      'Accept': "appilication/json",
      'Authorization': 'Bearer ${UserDetailsLocal.apiToken}',

    },);
    print("response->${response.body}");
    var jsonData = json.decode(response.body);
    categoryItemlist = jsonData;
    Cate = categoryItemlist["list"];
    print("categoryItemlist->${Cate}");
    // if (response.statusCode == 200) {
    //   var jsonData = json.decode(response.body);
    //   setState(() {
    //     categoryItemlist = jsonData;
    //     print("categoryItemlist->${categoryItemlist[0]["id"]}");
    //   });
    // }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Select',style: TextStyle(fontSize: 14,color: Colors.black),),
        ),
        items: Cate.map((item) {
          // int id = Cate["id"];
         //  print("id->>>>>${id}");
          return DropdownMenuItem(
            onTap: (){setState((){
              int id = item["id"];
              designatioids = id.toString();
              print("designatioids->>>>>>${designatioids}");
            });},
            value: item['id'].toString(),

            child: Text(item['name'].toString()),
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            dropdownvalue = newVal;

          });
        },
        value: dropdownvalue,
      ),
    );
  }
}