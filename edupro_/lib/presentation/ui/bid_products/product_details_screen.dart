import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:fluid_action_card/FluidActionCard/fluid_action_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pgs_edupro/application/bid_products/bid_products_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_detail_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/bid_instrction_screen.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/joinbid.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';

String product_id = '';

class ProductDetailsScreen extends StatefulWidget {
  final BidProducts productdetails;
  final String status;
  const ProductDetailsScreen({super.key, required this.productdetails,required this.status});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>with TickerProviderStateMixin
{
  static const List<Tab> _tabs = [
    Tab(
      icon: Text("Product Information"),
    ),
    Tab(
      icon: Text("How Its work"),
    ),
  ];
  List questions=["How to start bidding ?","Security Deposit / Bidding Power ?","Delivery time to the destination port?",
    "How to join to bid in an auction? ","How will I know if my bid was successful?"];
  List answers=["All successful bidders can confirm their winning bid by checking the “Sbidu”. In addition, all successful bidders will receive an email notifying them of their winning bid after the auction closes.",
    "All successful bidders can confirm their winning bid by checking the “Sbidu”. In addition, all successful bidders will receive an email notifying them of their winning bid after the auction closes. ",
    "All successful bidders can confirm their winning bid by checking the “Sbidu”. In addition, all successful bidders will receive an email notifying them of their winning bid after the auction closes.",
    "All successful bidders can confirm their winning bid by checking the “Sbidu”. In addition, all successful bidders will receive an email notifying them of their winning bid after the auction closes.",
    "All successful bidders can confirm their winning bid by checking the “Sbidu”. In addition, all successful bidders will receive an email notifying them of their winning bid after the auction closes."
  ];
  int selectedImage = 0;
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
                        // List<String> imageUrls =["${res.productGallery!.}"]
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
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 20),
                                    //   child: Align(
                                    //     alignment:
                                    //         AlignmentDirectional.topStart,
                                    //     child: Container(
                                    //       height: 55,
                                    //       width: 55,
                                    //       decoration: BoxDecoration(
                                    //           borderRadius:
                                    //               BorderRadius.circular(100),
                                    //           color: Colors.red,
                                    //           // shape: BoxShape.circle,
                                    //           boxShadow: [
                                    //             BoxShadow(
                                    //                 color: Colors.black38,
                                    //                 blurRadius: 4,
                                    //                 spreadRadius: 1,
                                    //                 offset: Offset(3, 3)),
                                    //             BoxShadow(
                                    //                 color: Colors.black38,
                                    //                 blurRadius: 4,
                                    //                 spreadRadius: 1,
                                    //                 offset: Offset(-3, -3))
                                    //           ]),
                                    //       child: Center(
                                    //           child: Text(
                                    //         "1:06:25",
                                    //         style:
                                    //             TextStyle(color: Colors.white),
                                    //       )),
                                    //     ),
                                    //   ),
                                    // ),
                                    thickSpace,
                                    SizedBox(
                                      width: screenWidth * 0.7,
                                      height: screenHeight * 0.25,
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Hero(
                                          tag: widget.productdetails!.id
                                              .toString(),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: UserDetailsLocal
                                                    .storageBaseUrl +
                                                '${(res.productGallery![selectedImage])}',
                                            placeholder: (context, url) =>
                                                Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/no_data.png'),
                                                // height: 60,
                                                // width: 60,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    thickSpace,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ...List.generate(
                                            res.productGallery!.length,
                                            (index) => buildSmallProductPreview(
                                                index, res.productGallery!)),
                                      ],
                                    ),
                                    thickSpace,
                                    Text(
                                      "${widget.productdetails.name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Divider(),
                                    Visibility(
                                      child: Container(
                                        width: screenWidth * 1,
                                        height: screenHeight * 0.07,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Price",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    "${widget.productdetails.price}",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      decoration: TextDecoration.lineThrough,
                                                        fontSize: 16
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    "₹1",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: primaryColor ,
                                                        fontSize: 16
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                    side:  BorderSide(
                                                      color: Colors.red,
                                                    )
                                                ),
                                                onPressed: () {
                                                  Get.to(() => JoinBid(
                                                        productdetails:
                                                            widget.productdetails,
                                                      ));
                                                },
                                                child: const Text('Join Now With Rs.1',style: TextStyle(color: Colors.black),),
                                              ) ,
                                            ],
                                          ),
                                        ),
                                      ),
                                      visible: widget.status== "Live",
                                    ),
                                    Visibility(
                                      child: Container(
                                        width: screenWidth * 1,
                                        height: screenHeight * 0.06,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 16
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Text(
                                              "${widget.productdetails.price}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.lineThrough,
                                                  fontSize: 16
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Text(
                                              "₹1",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,color: primaryColor ,fontSize: 16
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      visible: widget.status== "Upcoming",
                                    ),
                                    Divider(),
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
                                        indicatorColor:Colors.deepPurple[500] ,
                                        tabs: _tabs,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Container(
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.25,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width - 2,
                                        child: TabBarView(
                                          controller: _tabController,
                                          children: <Widget>[
                                            _auctionInfoWidget(),
                                            BidInstructionScreen()
                                            // Text("lm")
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
                                                    hintColor:
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
                                                    "Details",
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
                                                    hintColor:
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
                                              Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                    hintColor:
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
                                                    Icons.question_answer,
                                                    color: Colors.black,
                                                  ),
                                                  title: Text(
                                                    "FAQ",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  children: [
                                                    Theme(
                                                      data: Theme.of(context).copyWith(
                                                          hintColor: primaryColor,
                                                      ),
                                                      child: ListView.separated(
                                                          separatorBuilder: (context, index) =>
                                                              SizedBox(height: 15,),
                                                          physics: NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount:questions.length,
                                                          itemBuilder: (context,index) {
                                                            return Padding(
                                                              padding: const EdgeInsets.only(left: 12,right: 12),
                                                              child: ExpansionTileCard(
                                                                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                                elevation: 8,
                                                                borderRadius: BorderRadius.circular(15),
                                                                baseColor: Colors.grey[300],
                                                                title: Text(questions[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                                                children: <Widget>[
                                                                  Divider(
                                                                    thickness: 1.5,
                                                                    height: 1.0,
                                                                  ),
                                                                  SizedBox(height: 10,),
                                                                  Align(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.symmetric(
                                                                        horizontal: 16.0,
                                                                        vertical: 8.0,
                                                                      ),
                                                                      child: Text(
                                                                        answers[index],
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyText2!
                                                                            .copyWith(fontSize: 16),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  thickSpace,
                                                                  thickSpace
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                      ),
                                                    ),
                                                    thickSpace,
                                                    thickSpace
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

  GestureDetector buildSmallProductPreview(
      int index, List<String> productGallery) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color:
                  Colors.black38.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: CachedNetworkImage(
          width: screenWidth * 0.7,
          height: screenHeight * 0.25,
          fit: BoxFit.cover,
          imageUrl:
              UserDetailsLocal.storageBaseUrl + '${productGallery[index]}',
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: AssetImage('assets/images/no_data.png'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _auctionInfoWidget() {
    var startDate=DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse("${widget.productdetails.startDate}"));
    var endDate=DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse("${widget.productdetails.endDate}"));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          thickSpace,
          thickSpace,
          Row(
            children: [
              Text("Auction ID",style: TextStyle(fontWeight: FontWeight.bold),),
              Spacer(),
              Text("${widget.productdetails.auctionId}",style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text("Start Date and Time",style: TextStyle(fontWeight: FontWeight.bold),),
              Spacer(),
              Text("${startDate} , ${widget.productdetails.startTime}",style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text("End Date and Time",style: TextStyle(fontWeight: FontWeight.bold),),
              Spacer(),
              Text("${endDate} , ${widget.productdetails.endTime}",style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

}
