import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:pgs_edupro/presentation/widgets/youtube_video_player.dart';
import 'package:pgs_edupro/presentation/widgets/youtube_video_thumpnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class VideoVerticalListView extends StatelessWidget {
  final bool liveVideo;
  final List<Video> videoList;
  const VideoVerticalListView(
      {super.key, required this.videoList, this.liveVideo = false});

  @override
  Widget build(BuildContext context) {
    YoutubeThumpnail thumpnail = YoutubeThumpnail();
    return SizedBox(
      height: 215,
      // width: screenWidth,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: videoList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (liveVideo) {
                // launchUrlString(
                //   videoList[index].meetingLink ?? "",
                // );
                FlutterWebBrowser.openWebPage(
                  url: videoList[index].meetingLink ?? "",
                  customTabsOptions: CustomTabsOptions(
                    colorScheme: CustomTabsColorScheme.dark,
                    defaultColorSchemeParams:
                        CustomTabsColorSchemeParams(toolbarColor: primaryColor),
                    shareState: CustomTabsShareState.on,
                    instantAppsEnabled: true,
                    showTitle: true,
                    urlBarHidingEnabled: true,
                  ),
                  safariVCOptions: const SafariViewControllerOptions(
                    barCollapsingEnabled: true,
                    preferredBarTintColor: Colors.green,
                    preferredControlTintColor: Colors.amber,
                    dismissButtonStyle:
                        SafariViewControllerDismissButtonStyle.close,
                    modalPresentationCapturesStatusBarAppearance: true,
                  ),
                );
                return;
              }
              Get.to(() => YoutubeVideoPlayer(url: videoList[index].videoUrl!));
            },
            child: Card(
              elevation: 1,
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              margin: const EdgeInsets.fromLTRB(6, 6, 6, 6),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      width: 200,
                      //margin: const EdgeInsets.all(.5),
                      decoration: BoxDecoration(
                          //border: Border.all(width: .5, color: primaryColor),
                          borderRadius: BorderRadius.circular(6)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: liveVideo
                            ? CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: UserDetailsLocal.storageBaseUrl +
                                    videoList[index].videoThumbnail!,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Image(
                                  image: AssetImage(
                                      'assets/images/video_thumpnail_error.png'),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : FutureBuilder<String>(
                                future: thumpnail.getYoutubeVideoThumbnail(
                                    videoList[index].videoUrl ?? ''),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    default:
                                      if (snapshot.hasError) {
                                        return const Image(
                                          image: AssetImage(
                                              'assets/images/video_thumpnail_error.png'),
                                          fit: BoxFit.cover,
                                        );
                                      } else {
                                        return CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: snapshot.data ?? '',
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Image(
                                            image: AssetImage(
                                                'assets/images/video_thumpnail_error.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }
                                  }
                                },
                              ),
                      ),
                    ),
                    thickSpace,
                    SizedBox(
                      width: 200,
                      child: Text(
                        videoList[index].title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: boldValue,
                      ),
                    ),
                    thickSpace,
                    SizedBox(
                      width: 200,
                      child: Text(
                        videoList[index].description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                    ),
                    thickSpace
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
