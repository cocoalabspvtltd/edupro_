import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pgs_edupro/application/ads/ads_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/ads/ads_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        return state.isLoading
            ? Container(
                width: screenWidth,
                height: screenWidth * 9 / 16,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/gif/loaders/ads_loader.gif'))),
              )
            : state.loadFailureOrSuccessOption.fold(
                () => Container(),
                (either) {
                  return either.fold(
                    (failure) {
                      return Container();
                    },
                    (res) {
                      AdsResponse response = res;
                      return CarouselSlider.builder(
                          itemCount: response.adsList!.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              InkWell(
                                onTap: () {
                                  // launchUrlString('https://www.google.com');
                                  FlutterWebBrowser.openWebPage(
                                    url: response.adsList?[itemIndex].url ?? '',
                                    customTabsOptions: CustomTabsOptions(
                                      colorScheme: CustomTabsColorScheme.dark,
                                      defaultColorSchemeParams:
                                          CustomTabsColorSchemeParams(
                                              toolbarColor: primaryColor),
                                      shareState: CustomTabsShareState.on,
                                      instantAppsEnabled: true,
                                      showTitle: true,
                                      urlBarHidingEnabled: true,
                                    ),
                                    safariVCOptions:
                                        const SafariViewControllerOptions(
                                      barCollapsingEnabled: true,
                                      preferredBarTintColor: Colors.green,
                                      preferredControlTintColor: Colors.amber,
                                      dismissButtonStyle:
                                          SafariViewControllerDismissButtonStyle
                                              .close,
                                      modalPresentationCapturesStatusBarAppearance:
                                          true,
                                    ),
                                  );
                                },
                                child: CachedNetworkImage(
                                  fit: BoxFit.fitHeight,
                                  imageUrl: UserDetailsLocal.storageBaseUrl +
                                      (response.adsList?[itemIndex].image ??
                                          ''),
                                  placeholder: (context, url) => Container(
                                    width: screenWidth,
                                    height: screenWidth * 9 / 16,
                                    padding: const EdgeInsets.all(10),
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: screenWidth,
                                    height: screenWidth * 9 / 16,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    width: screenWidth,
                                    height: screenWidth * 9 / 16,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/drawer_icons/display-picture-sltd.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                          ));
                    },
                  );
                },
              );
      },
    );
  }
}
