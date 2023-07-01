import 'package:pgs_edupro/application/video/trending_videos/trending_videos_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:pgs_edupro/presentation/ui/videos/video_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/widgets/video_vertical_list_widget.dart';
import 'package:pgs_edupro/presentation/ui/videos/widgets/videos_grid_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:get/get.dart';

class TrendingVideosScreen extends StatelessWidget {
  final bool fromHome;
  const TrendingVideosScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingVideosBloc, TrendingVideosState>(
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
            VideoResponse res = state.videoResponse;
            return res.video!.isNotEmpty
                ? !fromHome
                    ? VideosGridView(videoList: res.video!)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                " Trending Courses ",
                                style: TextStyle(fontSize: 18,fontFamily: "Pacifico",)
                              ),
                              TextButton(
                                onPressed: () => Get.to(() => const VideoScreen(
                                      title: "Trending Videos",
                                    )),
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Pacifico",
                                      color: primaryColor[200]),
                                ),
                              )
                            ],
                          ),
                          thickSpaceLogin,
                          VideoVerticalListView(videoList: res.video!),
                        ],
                      )
                : Container();
            // SizedBox(
            //     height: !fromHome ? screenHeight : 300,
            //     width: screenWidth,
            //     child: const CommonResultsEmptyWidget());
          },
          loadFailure: (state) {
            return state.videoFailure.map(
                unexpected: ((value) {
                  return CommonApiErrorWidget("Unexpected Error \nTry Again",
                      () {
                    context
                        .read<TrendingVideosBloc>()
                        .add(const TrendingVideosEvent.loadVideos());
                  });
                }),
                serverError: ((value) {
                  return CommonApiErrorWidget(
                      "Server Error \n${value.errorCode}", () {
                    context
                        .read<TrendingVideosBloc>()
                        .add(const TrendingVideosEvent.loadVideos());
                  });
                }),
                noData: ((value) => SizedBox(
                    height: !fromHome ? screenHeight : 200,
                    width: screenWidth,
                    child: const CommonResultsEmptyWidget())),
                serverTimeOut: (value) {
                  return CommonApiErrorWidget("Server Time Out \nTry Again",
                      () {
                    context
                        .read<TrendingVideosBloc>()
                        .add(const TrendingVideosEvent.loadVideos());
                  });
                });
          },
          loadMoreInProgress: (LoadMoreInProgress value) => Container(),
        );
      },
    );
  }
}
