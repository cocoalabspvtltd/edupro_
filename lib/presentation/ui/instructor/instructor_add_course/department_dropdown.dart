import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';

import '../../../../application/Insistution_student_course_instructor/all_categories_bloc.dart';
import '../../../../domain/core/constants.dart';
import '../../../../infrastructure/remote_data/models/insistution/insistutionResponse.dart';
import '../../../../infrastructure/remote_data/repositories/course/course_repository.dart';
import '../../../widgets/common_result_empty_widget.dart';
import '../../../widgets/common_server_error_widget.dart';




String departmentName = "";
String departmentId= "";

class DepartmentDropdown extends StatefulWidget {
  const DepartmentDropdown({Key? key}) : super(key: key);

  @override
  _DepartmentDropdownState createState() => _DepartmentDropdownState();
}

class _DepartmentDropdownState extends State<DepartmentDropdown> {
  Map departmentItemlist ={};
  List department =[];

  // Future getAllCategory() async {
  //
  //
  //   http.Response response = await http.get(Uri.parse('https://pgsedu.com/EduPro/index.php/api/category'), headers: <String, String>{
  //     'Accept': "appilication/json",
  //     'Authorization': 'Bearer ${UserDetailsLocal.apiToken}',
  //
  //   },);
  //   print("response->${response.body}");
  //   var jsonData = json.decode(response.body);
  //   categoryItemlist = jsonData;
  //   Cate = categoryItemlist["list"];
  //   print("categoryItemlist->${Cate}");
  //   // if (response.statusCode == 200) {
  //   //   var jsonData = json.decode(response.body);
  //   //   setState(() {
  //   //     categoryItemlist = jsonData;
  //   //     print("categoryItemlist->${categoryItemlist[0]["id"]}");
  //   //   });
  //   // }
  //
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getAllCategory();
  //
  // }

  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (_) => AllCategoriesBloc(CourseRepository())
          ..add(const AllCategoriesEvent.loadMyCourses()),

        child: BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
          builder: (context, state) {
            return

              SizedBox(
                  height: screenHeight,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: state.map(
                      initial: (_) => Container(),
                      loadInProgress: (_) => SizedBox(
                        height: screenHeight - 180,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      loadSuccess: (state) {
                        InsistutionResponse res = state.response;
                        return res.category!= null ||
                            res.category!.isNotEmpty
                            ?  Column(
                          children: [

                            DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Text('Select',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black54),),
                                ),
                                items: res.category?.map((item) {
                                  // int id = Cate["id"];
                                  //  print("id->>>>>${id}");
                                  return DropdownMenuItem(
                                    onTap: (){setState((){
                                      String? id = item.name;
                                      departmentId= id.toString();
                                      //print("designatioids->>>>>>${categoryId}");
                                    });},
                                    value: item.id.toString(),
                                    child: Text(item.name.toString()),
                                  );
                                }).toList(),
                                onChanged: (newVal) {
                                  setState(() {
                                    dropdownvalue = newVal;

                                  });
                                },
                                value: dropdownvalue,
                              ),
                            ),
                          ],
                        )
                            : SizedBox(
                            height: screenHeight -
                                180, //!fromHome ? screenHeight : 300,
                            width: screenWidth,
                            child: const CommonResultsEmptyWidget());
                      },
                      loadFailure: (state) {
                        return state.networkFailure.map(
                            unexpected: ((value) {
                              return SizedBox(
                                height: screenHeight - 180,
                                child: CommonApiErrorWidget(
                                    "Unexpected Error \nTry Again", () {
                                  context
                                      .read<AllCategoriesBloc>()
                                      .add(const AllCategoriesEvent.loadMyCourses());
                                }),
                              );
                            }),
                            serverError: ((value) {
                              return SizedBox(
                                height: screenHeight - 180,
                                child: CommonApiErrorWidget(
                                    "Server Error \n${value.errorCode}", () {
                                  context
                                      .read<AllCategoriesBloc>()
                                      .add(const AllCategoriesEvent.loadMyCourses());
                                }),
                              );
                            }),
                            nullData: ((value) => SizedBox(
                                height:
                                screenHeight, //!fromHome ? screenHeight : 200,
                                width: screenWidth,
                                child: const CommonResultsEmptyWidget())),
                            serverTimeOut: (value) {
                              return SizedBox(
                                height: screenHeight - 180,
                                child: CommonApiErrorWidget(
                                    "Server Time Out \nTry Again", () {
                                  context
                                      .read<AllCategoriesBloc>()
                                      .add(const AllCategoriesEvent.loadMyCourses());
                                }),
                              );
                            },
                            unAuthorized: (value) => SizedBox(
                              height: screenHeight - 180,
                              child: CommonApiErrorWidget(value.message, () {
                                context
                                    .read<AllCategoriesBloc>()
                                    .add( AllCategoriesEvent.loadMyCourses());
                              }),
                            ));
                      },
                      loadMoreInProgress: (LoadMoreInProgress value) =>
                          Container(),
                    ),


                  ));},
        ),

      );

  }
}
