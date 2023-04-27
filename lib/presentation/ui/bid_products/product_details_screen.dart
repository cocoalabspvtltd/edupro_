import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/bid_products/bid_products_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_detail_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';

String product_id ='';
class ProductDetailsScreen extends StatefulWidget {
  final BidProducts productdetails;
  const ProductDetailsScreen({super.key, required this.productdetails});

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>with TickerProviderStateMixin  {

  static const List<Tab> _tabs = [
    Tab(
      icon: Text("Card Details"),
    ),
    Tab(
      icon: Text("Inclusive Offers"),
    ),
  ];
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme(""),
      body: BlocProvider(
        create: (_) => BidProductsBloc(BidsRepository())
          ..add(const BidProductsEvent.LoadProductsDetails()),
        child: Scaffold(
          body: BlocBuilder<BidProductsBloc, BidProductsState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  return context
                      .read<BidProductsBloc>()
                      .add(const BidProductsEvent.LoadProductsDetails());
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
                        BidProductDetailsResponse res = state.response;
                        return res.productDetails!.isEmpty
                            ? SizedBox(
                            height: screenHeight -
                                180, //!fromHome ? screenHeight : 300,
                            width: screenWidth,
                            child: const CommonResultsEmptyWidget())
                            : Column(
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
                              itemCount: res.productDetails!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Container(
                                                  width: screenWidth * 0.5,
                                                  height: screenWidth * 0.5,
                                                  padding: const EdgeInsets.all(1),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            imageUrl: UserDetailsLocal.storageBaseUrl +
                                                                '${widget.productdetails.productImage}',
                                                            placeholder: (context, url) =>
                                                                Container(
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
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              Column(
                                                children: [
                                                  Container(
                                                    height:55,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(width: 1.0, color: Colors.black),
                                                      //more than 50% of width makes circle
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.timelapse_outlined),
                                                            Text("1:06:25"),
                                                          ],
                                                        ),
                                                        thickSpace,
                                                        Text("Wait for Bid")
                                                      ],
                                                    ),
                                                  ),
                                                  thickSpace,
                                                  thickSpace,
                                                  Container(
                                                    height:70,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(width: 1.0, color: Colors.black),
                                                      //more than 50% of width makes circle
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text("Auction Price ${widget.productdetails.price}"),
                                                        thickSpace,
                                                        Text("Wait for Bid")
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.05,
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            child: TabBar(
                                              controller: _tabController,
                                              indicatorSize: TabBarIndicatorSize.tab,
                                              labelColor: Colors.deepPurple[500],
                                              tabs: _tabs,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Container(
                                              height: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height + 300,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width - 2,
                                              child: TabBarView(
                                                controller: _tabController,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                      ],
                                                    ),
                                                  ),
                                                 Text("Hai")
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
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
        ),
      ),
    );
  }
}