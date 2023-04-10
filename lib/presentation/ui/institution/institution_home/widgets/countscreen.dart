import 'package:pgs_edupro/application/insistution_count/insistution_bloc.dart';

import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/count.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:pgs_edupro/presentation/ui/videos/video_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/widgets/video_vertical_list_widget.dart';
import 'package:pgs_edupro/presentation/ui/videos/widgets/videos_grid_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:get/get.dart';

class CourtScreen extends StatelessWidget {
  final bool fromHome;
   CourtScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsistutionBloc, InsistutionState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => !fromHome
              ? SizedBox(
            height: screenHeight,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
              : Container(
            width: screenWidth,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/gif/loaders/course_loader.gif"),
                    fit: BoxFit.cover)),
          ),
          loadSuccess: (state) {
            CountResponse res = state.response;
            return res.count!.isNotEmpty
                ? !fromHome
                ? Container(color: Colors.red,)
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: screenHeight * 0.28,
                    width: screenWidth * 0.96,
                    child: GridView.builder(
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7 / 0.4),
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height:screenHeight * 0.4 ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: screenWidth * 0.03,),
                                Column(
                                  children: [
                                    SizedBox(height: screenHeight * 0.02,),
                                    Text("user Count",style: TextStyle(color: Colors.grey[800],fontSize: 16),),
                                    SizedBox(height: screenHeight * 0.01,),
                                    Text("${res.userCount}",style: TextStyle(color: Colors.grey[800]),),
                                  ],
                                ),
                                Spacer(),
                              //  Image.asset(images[index],width: screenWidth * 0.17,),
                                SizedBox(width: screenWidth * 0.08,)
                              ],
                            ),
                          );
                        })),
                Container(
                    height: screenHeight * 0.28,
                    width: screenWidth * 0.96,
                    child: GridView.builder(
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7 / 0.4),
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height:screenHeight * 0.4 ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: screenWidth * 0.03,),
                                Column(
                                  children: [
                                    SizedBox(height: screenHeight * 0.02,),
                                    Text("Instructor Count",style: TextStyle(color: Colors.grey[800],fontSize: 16),),
                                    SizedBox(height: screenHeight * 0.01,),
                                    Text("${res.instructorCount}",style: TextStyle(color: Colors.grey[800]),),
                                  ],
                                ),
                                Spacer(),
                                //  Image.asset(images[index],width: screenWidth * 0.17,),
                                SizedBox(width: screenWidth * 0.08,)
                              ],
                            ),
                          );
                        })),
                //VideoVerticalListView(videoList: res.video!),
              ],
            )
                : Container();
            // SizedBox(
            //     height: !fromHome ? screenHeight : 300,
            //     width: screenWidth,
            //     child: const CommonResultsEmptyWidget());
          },
          loadFailure: (state) {
            return Container();
          },
          loadMoreInProgress: (LoadMoreInProgress value) => Container(),
        );
      },
    );
  }
}
