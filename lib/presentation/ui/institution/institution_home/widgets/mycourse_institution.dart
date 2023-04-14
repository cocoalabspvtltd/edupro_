import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/application/Insistution_student_course_instructor/all_categories_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstitutionMyCoursesScreen extends StatelessWidget {
  final bool fromHome;
  const InstitutionMyCoursesScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AllCategoriesBloc(CourseRepository())
        ..add(const AllCategoriesEvent.loadMyCourses()),
  child: BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            return context
                .read<AllCategoriesBloc>()
                .add(const AllCategoriesEvent.loadMyCourses());
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
                  InsistutionResponse res = state.response;
                  return res.course != null ||
                      res.course!.isNotEmpty
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
                        itemCount: res.course!.length,
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
                                  leading: Container(
                                      width: screenWidth * .14,
                                      height: screenWidth * .14,
                                      padding: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: UserDetailsLocal.storageBaseUrl +
                                              '${res.course![index].courseThumbnail}',
                                          placeholder: (context, url) => Container(
                                            margin: const EdgeInsets.all(1),
                                            child: const Center(
                                              child: CircularProgressIndicator(),
                                            ),
                                          ),
                                          imageBuilder: (context, imageProvider) =>
                                              Container(
                                                margin: const EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover)),
                                              ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                                width: screenWidth * .14,
                                                height: screenWidth * .14,
                                                padding: const EdgeInsets.all(5),
                                                child: const Image(
                                                  image: AssetImage(
                                                      'assets/icons/drawer_icons/display-picture-sltd.png'),
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                ),
                                              ),
                                        ),
                                      )),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${res.course![index].title} ',
                                          style: TextStyle(fontSize: 20,
                                              color:
                                              Colors.black,fontWeight: FontWeight.bold
                                          )),
                                      const SizedBox(height: 5,),
                                      Text('${res.course![index].category} ',
                                          style: TextStyle(fontSize: 20,
                                              color:
                                              Colors.black,fontWeight: FontWeight.bold
                                          )),
                                    ],
                                  ),
                                  subtitle: Text(
                                    '${res.course![index].instructor} ',
                                    style: TextStyle(
                                      fontSize: 20, color: Colors.black,),
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
                    Container(height:40,width:50,color: Colors.grey,),
              ),
            ),
          ),
        );
      },
    ),
);
  }
}
