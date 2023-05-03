import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pgs_edupro/application/bid_products/bid_products_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_detail_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';

String product_id = '';

class ProductDetailsScreen extends StatefulWidget {
  final BidProducts productdetails;
  const ProductDetailsScreen({super.key, required this.productdetails});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  static const List<Tab> _tabs = [
    Tab(
      icon: Text("Auction Information"),
    ),
    Tab(
      icon: Text("Biding History"),
    ),
    Tab(
      icon: Text("Delivery Information"),
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
      appBar: appBarTheme("Product Details"),
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
                        return widget.productdetails == null
                            ? SizedBox(
                                height: screenHeight -
                                    180, //!fromHome ? screenHeight : 300,
                                width: screenWidth,
                                child: const CommonResultsEmptyWidget())
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.red,
                                              // shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black38,
                                                    blurRadius: 4,
                                                    spreadRadius: 1,
                                                    offset: Offset(3, 3)),
                                                BoxShadow(
                                                    color: Colors.black38,
                                                    blurRadius: 4,
                                                    spreadRadius: 1,
                                                    offset: Offset(-3, -3))
                                              ]),
                                          child: Center(
                                              child: Text(
                                            "1:06:25",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        width: screenWidth * 0.5,
                                        height: screenWidth * 0.5,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: UserDetailsLocal
                                                      .storageBaseUrl +
                                                  '${widget.productdetails.productImage}',
                                              placeholder: (context, url) =>
                                                  Container(
                                                margin: const EdgeInsets.all(1),
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              ),
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                margin: const EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover)),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                width: screenWidth * .14,
                                                height: screenWidth * .14,
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: const Image(
                                                  image: AssetImage(
                                                      'assets/icons/drawer_icons/display-picture-sltd.png'),
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                    Text(
                                      "${widget.productdetails.name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Divider(),
                                    Container(
                                      width: screenWidth * 1,
                                      height: screenHeight * 0.07,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Auction Price ${widget.productdetails.price}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                    primary: Colors.deepPurple),
                                                onPressed: () {},
                                                child: Text("BID NOW")),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                          ),
                                          onPressed: () {
                                            if (_tabController!
                                                .index >
                                                0) {
                                              _tabController!
                                                  .animateTo(
                                                  _tabController!
                                                      .index -
                                                      1);
                                            } else {
                                              Text("Can't go back");
                                            }
                                          },
                                        ),
                                        Expanded(
                                          child: TabBar(
                                            isScrollable: true,
                                            controller:
                                            _tabController,
                                            indicatorSize:
                                            TabBarIndicatorSize
                                                .tab,
                                            labelColor: Color(0xFFB226B2),
                                            tabs: _tabs,
                                            indicatorColor: Colors.deepPurple,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons
                                              .arrow_forward_ios),
                                          onPressed: () {
                                            if (_tabController!
                                                .index +
                                                1 <
                                                20) {
                                              _tabController!
                                                  .animateTo(
                                                  _tabController!
                                                      .index +
                                                      1);
                                            } else {
                                              Text(
                                                  "Can't move forward");
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.22,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width -
                                            2,
                                        child: TabBarView(
                                          controller: _tabController,
                                          children: [
                                            _auctionInfoWidget(),
                                            Text("History"),
                                            Text("Delivery info")
                                          ],
                                        ),
                                      ),
                                    ),
                                    ListView.separated(
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          height: 4,
                                        );
                                      },
                                      physics: const ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: res.productDetails!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                        accentColor:
                                                            primaryColor),
                                                child: ExpansionTileCard(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 10, 0),
                                                  elevation: 8,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  baseColor: Colors.grey[300],
                                                  leading: Icon(
                                                    Icons
                                                        .military_tech_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  title: Text(
                                                    "Technical Details",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  children: <Widget>[
                                                    Divider(
                                                      thickness: 1.5,
                                                      height: 1.0,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 8.0,
                                                        ),
                                                        child: Html(
                                                          data: res
                                                              .productDetails![
                                                                  index]
                                                              .technicalDetails,
                                                          tagsList: Html.tags
                                                            ..addAll([
                                                              "bird",
                                                              "flutter"
                                                            ]),
                                                          style: {
                                                            'h5': Style(
                                                                maxLines: 2,
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          },
                                                          customRender: {
                                                            "bird":
                                                                (RenderContext
                                                                        context,
                                                                    Widget
                                                                        child) {
                                                              return TextSpan(
                                                                  text: "🐦");
                                                            },
                                                            "flutter":
                                                                (RenderContext
                                                                        context,
                                                                    Widget
                                                                        child) {
                                                              return FlutterLogo(
                                                                style: (context.tree.element!.attributes[
                                                                            'horizontal'] !=
                                                                        null)
                                                                    ? FlutterLogoStyle
                                                                        .horizontal
                                                                    : FlutterLogoStyle
                                                                        .markOnly,
                                                                textColor:
                                                                    context
                                                                        .style
                                                                        .color!,
                                                                size: context
                                                                        .style
                                                                        .fontSize!
                                                                        .size! *
                                                                    5,
                                                              );
                                                            },
                                                          },
                                                          onLinkTap: (url, _,
                                                              __, ___) {
                                                            print(
                                                                "Opening $url...");
                                                          },
                                                          onImageTap: (src, _,
                                                              __, ___) {
                                                            print(src);
                                                          },
                                                          onImageError:
                                                              (exception,
                                                                  stackTrace) {},
                                                          onCssParseError:
                                                              (css, messages) {
                                                            messages.forEach(
                                                                (element) {
                                                              print(element);
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              thickSpace,
                                              Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                        accentColor:
                                                            primaryColor),
                                                child: ExpansionTileCard(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 10, 0),
                                                  elevation: 8,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  baseColor: Colors.grey[300],
                                                  leading: Icon(
                                                    Icons
                                                        .featured_play_list_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  title: Text(
                                                    "Features",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  children: <Widget>[
                                                    Divider(
                                                      thickness: 1.5,
                                                      height: 1.0,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 8.0,
                                                        ),
                                                        child: Html(
                                                          data: res
                                                              .productDetails![
                                                                  index]
                                                              .features,
                                                          tagsList: Html.tags
                                                            ..addAll([
                                                              "bird",
                                                              "flutter"
                                                            ]),
                                                          style: {
                                                            'h5': Style(
                                                                maxLines: 2,
                                                                textOverflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          },
                                                          customRender: {
                                                            "bird":
                                                                (RenderContext
                                                                        context,
                                                                    Widget
                                                                        child) {
                                                              return TextSpan(
                                                                  text: "🐦");
                                                            },
                                                            "flutter":
                                                                (RenderContext
                                                                        context,
                                                                    Widget
                                                                        child) {
                                                              return FlutterLogo(
                                                                style: (context.tree.element!.attributes[
                                                                            'horizontal'] !=
                                                                        null)
                                                                    ? FlutterLogoStyle
                                                                        .horizontal
                                                                    : FlutterLogoStyle
                                                                        .markOnly,
                                                                textColor:
                                                                    context
                                                                        .style
                                                                        .color!,
                                                                size: context
                                                                        .style
                                                                        .fontSize!
                                                                        .size! *
                                                                    5,
                                                              );
                                                            },
                                                          },
                                                          onLinkTap: (url, _,
                                                              __, ___) {
                                                            print(
                                                                "Opening $url...");
                                                          },
                                                          onImageTap: (src, _,
                                                              __, ___) {
                                                            print(src);
                                                          },
                                                          onImageError:
                                                              (exception,
                                                                  stackTrace) {},
                                                          onCssParseError:
                                                              (css, messages) {
                                                            messages.forEach(
                                                                (element) {
                                                              print(element);
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              thickSpace,
                                              thickSpace,
                                              thickSpace,
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
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
                                      const BidProductsEvent
                                          .LoadLiveProducts());
                                }),
                              );
                            }),
                            serverError: ((value) {
                              return SizedBox(
                                height: screenHeight - 180,
                                child: CommonApiErrorWidget(
                                    "Server Error \n${value.errorCode}", () {
                                  context.read<BidProductsBloc>().add(
                                      const BidProductsEvent
                                          .LoadLiveProducts());
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
                                      const BidProductsEvent
                                          .LoadLiveProducts());
                                }),
                              );
                            },
                            unAuthorized: (value) => SizedBox(
                                  height: screenHeight - 180,
                                  child:
                                      CommonApiErrorWidget(value.message, () {
                                    context.read<BidProductsBloc>().add(
                                        BidProductsEvent.LoadLiveProducts());
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
        ),
      ),
    );
  }

  Widget _auctionInfoWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Auction ID"),
              Spacer(),
              Text("${widget.productdetails.auctionId}"),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text("Price"),
              Spacer(),
              Text("${widget.productdetails.price}"),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text("Shipping & Processing Fees"),
              Spacer(),
              Text("${widget.productdetails.shippingFee}"),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text("Bid Reset Time"),
              Spacer(),
              // Text("${widget.productdetails.bidResetTime}"),
              Text(""),
            ],
          ),
          Divider(),
          // Theme(
          //   data: Theme.of(context).copyWith(accentColor: primaryColor),
          //   child: ExpansionTileCard(
          //     contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          //     elevation: 8,
          //     borderRadius: BorderRadius.circular(15),
          //     baseColor: Colors.grey[300],
          //     leading: Icon(Icons.local_offer_outlined,color: Colors.black,),
          //     title: Text("${widget.hoteldetails.offerTitle}", style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.w600,
          //         color: Colors.black),),
          //     children: <Widget>[
          //       Divider(
          //         thickness: 1.5,
          //         height: 1.0,
          //       ),
          //       SizedBox(height: 10,),
          //       Align(
          //         alignment: Alignment.centerLeft,
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 16.0,
          //             vertical: 8.0,
          //           ),
          //           child: Html(
          //             data: widget.hoteldetails.termsConditions,
          //             tagsList: Html.tags..addAll(["bird", "flutter"]),
          //             style: {
          //               'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
          //             },
          //             customRender: {
          //               "bird": (RenderContext context, Widget child) {
          //                 return TextSpan(text: "🐦");
          //               },
          //               "flutter": (RenderContext context, Widget child) {
          //                 return FlutterLogo(
          //                   style: (context.tree.element!.attributes['horizontal'] != null)
          //                       ? FlutterLogoStyle.horizontal
          //                       : FlutterLogoStyle.markOnly,
          //                   textColor: context.style.color!,
          //                   size: context.style.fontSize!.size! * 5,
          //                 );
          //               },
          //             },
          //             onLinkTap: (url, _, __, ___) {
          //               print("Opening $url...");
          //             },
          //             onImageTap: (src, _, __, ___) {
          //               print(src);
          //             },
          //             onImageError: (exception, stackTrace) {
          //             },
          //             onCssParseError: (css, messages) {
          //               messages.forEach((element) {
          //                 print(element);
          //               });
          //             },
          //           ),
          //         ),
          //       ),
          //       SizedBox(height: 20,)
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
