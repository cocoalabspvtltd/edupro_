import 'package:pgs_edupro/application/video/live_videos/live_videos_bloc_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/videos/video_repository.dart';
import 'package:pgs_edupro/presentation/ui/videos/video_screen.dart';
import 'package:pgs_edupro/presentation/ui/videos/widgets/video_vertical_list_widget.dart';
import 'package:pgs_edupro/presentation/ui/videos/widgets/videos_grid_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:get/get.dart';

class LiveVideosScreen extends StatelessWidget {
  final bool fromHome;
  const LiveVideosScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currently Live"),
      ),
      body: BlocProvider(
        create: (context) => LiveVideosBloc(VideoRepository())
          ..add(const LiveVideosEvent.loadVideos()),
        child: BlocBuilder<LiveVideosBloc, LiveVideosState>(
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
                        ? VideosGridView(
                            videoList: res.video!,
                            liveVideo: true,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Live Videos ",
                                    style: boldWord,
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Get.to(() => const VideoScreen(
                                              title: "Live Videos",
                                            )),
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(0)),
                                    child: Text(
                                      "See All",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor[200]),
                                    ),
                                  )
                                ],
                              ),
                              VideoVerticalListView(
                                videoList: res.video!,
                                liveVideo: true,
                              ),
                            ],
                          )
                    : Container();
                // SizedBox(
                //     height: fromHome ? screenHeight : 300,
                //     width: screenWidth,
                //     child: const CommonResultsEmptyWidget());
              },
              loadFailure: (state) {
                return state.videoFailure.map(
                    unexpected: ((value) {
                      return CommonApiErrorWidget(
                          "Unexpected Error \nTry Again", () {
                        context
                            .read<LiveVideosBloc>()
                            .add(const LiveVideosEvent.loadVideos());
                      });
                    }),
                    serverError: ((value) {
                      return CommonApiErrorWidget(value.errorCode, () {
                        context
                            .read<LiveVideosBloc>()
                            .add(const LiveVideosEvent.loadVideos());
                      });
                    }),
                    noData: ((value) => SizedBox(
                        height: fromHome ? screenHeight : 200,
                        width: screenWidth,
                        child: const CommonResultsEmptyWidget())),
                    serverTimeOut: (value) {
                      return CommonApiErrorWidget("Server Time Out \nTry Again",
                          () {
                        context
                            .read<LiveVideosBloc>()
                            .add(const LiveVideosEvent.loadVideos());
                      });
                    });
              },
              loadMoreInProgress: (LoadMoreInProgress value) => Container(),
            );
          },
        ),
      ),
    );
  }
}
