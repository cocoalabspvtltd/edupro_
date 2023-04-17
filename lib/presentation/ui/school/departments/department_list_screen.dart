import 'package:pgs_edupro/application/Insistution_deletion_student/student_deletion_bloc.dart';
import 'package:pgs_edupro/application/Insistution_student_course_instructor/all_categories_bloc.dart';
import 'package:pgs_edupro/application/school_department_list/department_list_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/school/department_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SchoolDepartmentlistScreen extends StatelessWidget {
  final bool fromHome;

  const SchoolDepartmentlistScreen({super.key, this.fromHome = true});

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Departments",
          style: boldValuePrimaryColor,
        ),
      ),
      body: MultiBlocProvider(
        providers:[
          BlocProvider(
            create: (_) => DepartmentListBloc(CourseRepository())
              ..add(const DepartmentListEvent.LoadDepartments()),

          ),
          BlocProvider(
            create: (_) => StudentDeletionBloc(CourseRepository())
              ..add( StudentDeletionEvent.saveAndUpdatePressed()),


          ),
        ], child:  Scaffold(
        body: BlocBuilder<DepartmentListBloc, DepartmentListState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                return context
                    .read<DepartmentListBloc>()
                    .add(const DepartmentListEvent.LoadDepartments());
              },
              child: SizedBox(
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
                      DepartmentListResponse res = state.response;
                      return res.department != null ||
                          res.department!.isNotEmpty
                          ?  Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(
                                height: 4,
                              );
                            },
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: res.department!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  elevation: 1,
                                  color: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                                    child: ListTile(
                                      // selected: selectedIndex == index ? true : false,
                                      isThreeLine: true,
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${res.department![index].name} ',
                                              style: TextStyle(fontSize: 18,
                                                  color:
                                                  Colors.black
                                              )),
                                          const SizedBox(height: 5,),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${res.department![index].instituteName} ',
                                            style: TextStyle(
                                              fontSize: 18, color: Colors.black,),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              CircleAvatar(
                                                radius: 16,
                                                backgroundColor:Colors.pink[300],
                                                child: IconButton(
                                                  onPressed: () {
                                                  },
                                                  icon: const Icon(Icons.edit,
                                                    color: Colors.white, size: 15,),
                                                ),
                                              ),
                                              const SizedBox(width: 7,),
                                              CircleAvatar(
                                                radius: 16,
                                                backgroundColor: Colors.red,
                                                child: IconButton(
                                                  onPressed:() {
                                                    // StudenyEmail= res
                                                    //     .studentList![index]
                                                    //     .email!;
                                                    // context
                                                    //     .read<
                                                    //     StudentDeletionBloc>()
                                                    //     .add(
                                                    //     StudentDeletionEvent
                                                    //         .saveAndUpdatePressed(
                                                    //     ))
                                                    // ;
                                                  }, style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                ),

                                                  icon: const Icon(Icons.delete,
                                                    color: Colors.white, size: 15,),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),));
                            },
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
                                    .read<DepartmentListBloc>()
                                    .add(const DepartmentListEvent.LoadDepartments());
                              }),
                            );
                          }),
                          serverError: ((value) {
                            return SizedBox(
                              height: screenHeight - 180,
                              child: CommonApiErrorWidget(
                                  "Server Error \n${value.errorCode}", () {
                                context
                                    .read<DepartmentListBloc>()
                                    .add(const DepartmentListEvent.LoadDepartments());
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
                                    .read<DepartmentListBloc>()
                                    .add(const DepartmentListEvent.LoadDepartments());
                              }),
                            );
                          },
                          unAuthorized: (value) => SizedBox(
                            height: screenHeight - 180,
                            child: CommonApiErrorWidget(value.message, () {
                              context
                                  .read<DepartmentListBloc>()
                                  .add( DepartmentListEvent.LoadDepartments());
                            }),
                          ));
                    },
                    loadMoreInProgress: (LoadMoreInProgress value) =>
                        Container(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      ),
    );
  }
}
