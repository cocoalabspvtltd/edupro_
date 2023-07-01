import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pgs_edupro/application/bid_products/bid_products_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/product_details_screen.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';


class LiveProductlistScreen extends StatelessWidget {
  final bool fromHome;

  const LiveProductlistScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BidProductsBloc(BidsRepository())
        ..add(const BidProductsEvent.LoadLiveProducts()),
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
                                SizedBox(
                                  width: screenWidth * 0.9,
                                  height: screenHeight * 0.45,
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
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              thickSpace,
                                              thickSpace,
                                              thickSpace,
                                              Text(
                                                "You can join here by adding ",
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("RS.1 ",style: TextStyle(
                                                      color: primaryColor, fontSize: 16,fontWeight: FontWeight.bold),),
                                                  Text("and Win this product",style: TextStyle(
                                                      color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                              thickSpace,
                                              thickSpace,
                                              thickSpace,
                                              Container(
                                                width: screenWidth * 0.4,
                                                padding: EdgeInsets.all(1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12),
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
                                                    errorWidget: (context,
                                                            url, error) =>
                                                        ClipRRect(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(12),
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
                                                    res.bidProducts![index], status: 'Live',),);
                                                  print("iddd${product_id}");
                                                }, child: Text("View Details")),
                                              ),
                                              // Text(
                                              //   "Auction ID : ${res.bidProducts![index].auctionId}",
                                              //   style: TextStyle(
                                              //       fontWeight:
                                              //           FontWeight.normal,
                                              //       color: Colors.grey[800]),
                                              // ),
                                              // thickSpace,
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.center,
                                              //   children: [
                                              //     Icon(Icons.lock_clock),
                                              //     Text(
                                              //       "From ${res.bidProducts![index].startTime} To ${res.bidProducts![index].endTime}",
                                              //       style: TextStyle(
                                              //           fontWeight:
                                              //               FontWeight.normal,
                                              //           color:
                                              //               Colors.grey[800]),
                                              //     ),
                                              //   ],
                                              // ),
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
