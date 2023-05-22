import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:pgs_edupro/application/bid_products/bid_products_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/product_details_screen.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';


class UpcomigProductlistScreen extends StatelessWidget {
  final bool fromHome;

  const UpcomigProductlistScreen({super.key, this.fromHome = true});

  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BidProductsBloc(BidsRepository())
        ..add(const BidProductsEvent.LoadUpcomingProducts()),
      child: BlocBuilder<BidProductsBloc, BidProductsState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              return context
                  .read<BidProductsBloc>()
                  .add(const BidProductsEvent.LoadLiveProducts());
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
                    BidProductResponse res = state.response;
                    return res.bidProducts != null
                        ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          SizedBox(
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.5,
                            child: Card(
                              child: CarouselSlider.builder(
                                  itemCount: res.bidProducts!.length,
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    aspectRatio: 1 / (5 / 3),
                                    enableInfiniteScroll: false,
                                    enlargeCenterPage: true,
                                  ),
                                  itemBuilder: (context, index, realIdx) {
                                    var startDate=DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse("${res.bidProducts![index].startDate}"));
                                    var endDate=DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse("${res.bidProducts![index].endDate}"));
                                    return Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        thickSpace,
                                        thickSpace,
                                        Column(
                                          children: [
                                            Text(
                                              "Bid section start",
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 16,fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "from",
                                                  style: TextStyle(
                                                      color: Colors.black, fontSize: 15,fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(width: 5,),
                                                Text(
                                                  "${startDate}",
                                                  style: TextStyle(
                                                      color: primaryColor,fontSize: 15,fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(width: 5,),
                                                Text(
                                                  "To",
                                                  style: TextStyle(
                                                      color: Colors.black, fontSize: 15,fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(width: 5,),
                                                Text(
                                                  "${endDate}",
                                                  style: TextStyle(
                                                      color:primaryColor, fontSize: 15,fontWeight: FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        thickSpace,
                                        thickSpace,
                                        thickSpace,
                                        Container(
                                          width: screenWidth * 0.4,
                                          height: screenHeight * 0.2,
                                          padding: EdgeInsets.all(1),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              imageUrl: UserDetailsLocal
                                                  .storageBaseUrl +
                                                  '${res.bidProducts![index].productImage}',
                                              placeholder:
                                                  (context, url) =>
                                                  Center(
                                                    child:
                                                    CircularProgressIndicator(),
                                                  ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                  ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/images/dp.png'),
                                                      // height: 60,
                                                      // width: 60,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                        ),
                                        thickSpace,
                                        thickSpace,
                                        SizedBox(
                                          height: 40,
                                          child: ElevatedButton(onPressed: (){
                                            product_id = res
                                                .bidProducts![index].id!
                                                .toString();
                                            Get.to(() => ProductDetailsScreen(
                                              productdetails:
                                              res.bidProducts![index], status: 'Upcoming',),);
                                            print("iddd${product_id}");
                                          }, child: Text("View Details")),
                                        ),
                                        thickSpace,
                                        thickSpace,
                                      ],
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
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
                              context.read<BidProductsBloc>().add(
                                  const BidProductsEvent.LoadLiveProducts());
                            }),
                          );
                        }),
                        serverError: ((value) {
                          return SizedBox(
                            height: screenHeight - 180,
                            child: CommonApiErrorWidget(
                                "Server Error \n${value.errorCode}", () {
                              context.read<BidProductsBloc>().add(
                                  const BidProductsEvent.LoadLiveProducts());
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
                              context.read<BidProductsBloc>().add(
                                  const BidProductsEvent.LoadLiveProducts());
                            }),
                          );
                        },
                        unAuthorized: (value) => SizedBox(
                          height: screenHeight - 180,
                          child: CommonApiErrorWidget(value.message, () {
                            context
                                .read<BidProductsBloc>()
                                .add(BidProductsEvent.LoadLiveProducts());
                          }),
                        ));
                  },
                  loadMoreInProgress: (LoadMoreInProgress value) => Container(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
