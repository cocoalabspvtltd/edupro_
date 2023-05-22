import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pgs_edupro/application/bid_products/bid_products_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_detail_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:pgs_edupro/presentation/widgets/youtube_player_widget.dart';

String product_id = '';

class ClosedProductDetailsScreen extends StatefulWidget {
  final BidProducts productdetails;
  const ClosedProductDetailsScreen({super.key, required this.productdetails});

  @override
  State<ClosedProductDetailsScreen> createState() => _ClosedProductDetailsScreenState();
}

class _ClosedProductDetailsScreenState extends State<ClosedProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var startDate=DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse("${widget.productdetails.startDate}"));
    var endDate=DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse("${widget.productdetails.endDate}"));
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
                              thickSpace,
                              thickSpace,
                              thickSpace,
                              YoutubeVideoPlayerWidget(
                                url: "https://youtu.be/V-hysLdbRZc",
                                displayPlayerOnly: true,
                              ),
                              thickSpace,
                              thickSpace,
                              Text(
                                "${widget.productdetails.name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 18
                                ),),
                                thickSpace,
                                thickSpace,
                              thickSpace,
                              thickSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text("Auction ID"),
                                    Spacer(),
                                    Text("${widget.productdetails.auctionId}"),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text("Start Date and Time"),
                                    Spacer(),
                                    Text("${startDate},${widget.productdetails.startTime}"),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text("End Date and Time"),
                                    Spacer(),
                                    Text("${endDate},${widget.productdetails.endTime}"),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                                Divider(),
                              thickSpace,
                              thickSpace,
                              thickSpace,
                              Container(
                                height: 90,
                                width: screenWidth * 0.44,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(45)),
                                child: AnimateGradient(
                                  primaryBegin: Alignment.topLeft,
                                  primaryEnd: Alignment.bottomLeft,
                                  secondaryBegin: Alignment.bottomLeft,
                                  secondaryEnd: Alignment.topRight,
                                  primaryColors: const [
                                    Colors.deepOrange,
                                    Colors.orangeAccent,
                                    Colors.purpleAccent,
                                  ],
                                  secondaryColors: const [
                                    Colors.deepOrange,
                                    Colors.purpleAccent,
                                    Colors.purple,
                                  ],
                                  child: Center(
                                      child: Text(
                                        'Winner : name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "Pacifico",
                                            color: Colors.white,
                                            fontSize: 14),
                                      )),
                                ),
                                //
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
              Text("End date"),
              Spacer(),
              // Text("${widget.productdetails.bidResetTime}"),
              Text("20/05/2023"),
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
