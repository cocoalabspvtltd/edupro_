import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/bid_products/bid_products_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';


class BidProductlistScreen extends StatelessWidget {
  final bool fromHome;

  const BidProductlistScreen({super.key, this.fromHome = true});

  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BidProductsBloc(BidsRepository())
        ..add(const BidProductsEvent.LoadBidProducts()),
      child: BlocBuilder<BidProductsBloc, BidProductsState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                return context
                    .read<BidProductsBloc>()
                    .add(const BidProductsEvent.LoadBidProducts());
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
                          ?  Container(
                          height: screenHeight ,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children:[
                              thickSpace,
                              CarouselSlider.builder(
                                  itemCount: res.bidProducts!.length,
                                  options: CarouselOptions(
                                    autoPlay: false,
                                    aspectRatio: 1 / (5/ 3),
                                    enableInfiniteScroll: false,
                                    enlargeCenterPage: true,
                                  ),
                                  itemBuilder: (context, index, realIdx) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 20,),
                                        Container(
                                          // height: screenWidth - 110,
                                          width: screenWidth -10,
                                          padding: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: UserDetailsLocal.storageBaseUrl +
                                                  '${res.bidProducts![index].productImage}',
                                              placeholder: (context, url) => Center(
                                                child: CircularProgressIndicator(),
                                              ),
                                              errorWidget: (context, url, error) => ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child: Image(
                                                  image: AssetImage('assets/images/dp.png'),
                                                  // height: 60,
                                                  // width: 60,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        thickSpace,
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        SizedBox(
                                          height: 50,
                                          width: screenWidth * 0.5,
                                          child: ElevatedButton(
                                            onPressed: (){
                                            },
                                            child: const Text('Bid Now'),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),

                            ],
                          ))
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
                                    .read<BidProductsBloc>()
                                    .add(const BidProductsEvent.LoadBidProducts());
                              }),
                            );
                          }),
                          serverError: ((value) {
                            return SizedBox(
                              height: screenHeight - 180,
                              child: CommonApiErrorWidget(
                                  "Server Error \n${value.errorCode}", () {
                                context
                                    .read<BidProductsBloc>()
                                    .add(const BidProductsEvent.LoadBidProducts());
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
                                    .read<BidProductsBloc>()
                                    .add(const BidProductsEvent.LoadBidProducts());
                              }),
                            );
                          },
                          unAuthorized: (value) => SizedBox(
                            height: screenHeight - 180,
                            child: CommonApiErrorWidget(value.message, () {
                              context
                                  .read<BidProductsBloc>()
                                  .add( BidProductsEvent.LoadBidProducts());
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
      );
  }
}
