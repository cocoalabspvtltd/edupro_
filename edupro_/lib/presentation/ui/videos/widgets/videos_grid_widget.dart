import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/video/video_response.dart';
import 'package:pgs_edupro/presentation/widgets/youtube_video_player.dart';
import 'package:pgs_edupro/presentation/widgets/youtube_video_thumpnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';

class VideosGridView extends StatelessWidget {
  final List<Video> videoList;
  final bool liveVideo;
  const VideosGridView({
    super.key,
    required this.videoList,
    this.liveVideo = false,
  });

  @override
  Widget build(BuildContext context) {
    YoutubeThumpnail thumpnail = YoutubeThumpnail();

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 3 / 3.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemCount: videoList.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () {
              if (liveVideo) {
                FlutterWebBrowser.openWebPage(
                  url:
                      "https://us05web.zoom.us/j/84655957153?pwd=NURqOTJqNlBOTzRaRHlBYzFhbHhRZz09",
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
              color: scaffoldBackgroundColor,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              //margin: const EdgeInsets.fromLTRB(6, 6, 6, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: (screenWidth / 2 - (10)) * 9 / 16,
                    width: screenWidth / 2 - (10),
                    // margin: const EdgeInsets.all(.5),
                    decoration: BoxDecoration(
                        // border: Border.all(width: .5, color: primaryColor),
                        borderRadius: BorderRadius.circular(6)),
                    //Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: liveVideo
                          ? CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: UserDetailsLocal.storageBaseUrl +
                                  videoList[index].videoThumbnail!,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => const Image(
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
                                        fit: BoxFit.fitWidth,
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
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      videoList[index].title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: boldValue,
                    ),
                  ),
                  thickSpace,
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      videoList[index].description!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: smallText,
                    ),
                  ),
                  thickSpace
                ],
              ),
            ),
          );
        });
  }
}
