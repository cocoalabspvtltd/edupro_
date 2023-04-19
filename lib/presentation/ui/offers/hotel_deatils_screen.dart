import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pgs_edupro/application/Hotel/hotel_list_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/hotel_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/vouchers_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/offers/offers_repository.dart';
import 'package:pgs_edupro/presentation/ui/offers/voucher_list_screen.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
String roomrate ='';
String offeramount='';

class HotelDetailsScreen extends StatefulWidget {
  final HotelList hoteldetails;
  const HotelDetailsScreen({super.key, required this.hoteldetails});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen>
    with TickerProviderStateMixin {
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
 TextEditingController quantity =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotelListBloc(OffersRepository())
        ..add(const HotelListEvent.LoadHotels()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Hotels",
            style: boldValuePrimaryColor,
          ),
        ),
        body: BlocBuilder<HotelListBloc, HotelListState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                return context
                    .read<HotelListBloc>()
                    .add(const HotelListEvent.LoadHotels());
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
                      HotelListResponse res = state.response;
                      return res.hotelList != null ||
                          res.hotelList!.isNotEmpty
                          ?  Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                    width: screenWidth,
                                    height: screenWidth * 0.45,
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: UserDetailsLocal.storageBaseUrl +
                                                '${widget.hoteldetails.hotelImage}',
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
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            //you can use "right" and "bottom" too
                                            child: Container(
                                              height: 30,
                                              width: 60,
                                              color: primaryColor,
                                              child: Center(
                                                  child: Text(
                                                      "${widget.hoteldetails.discount} OFF")),
                                            )),
                                      ],
                                    )),
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
                                        SizedBox(height: 10,),
                                        Text(
                                          "${widget.hoteldetails.name!.toUpperCase()}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 20,),
                                        Text(
                                          "Validity: 365 Days from the date of activation", style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),),
                                        SizedBox(height: 20,),

                                        Row(
                                          children: [
                                            Text("RS : ${widget.hoteldetails.roomRate}",
                                              style: TextStyle(fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                decoration: TextDecoration.lineThrough,),),
                                            SizedBox(width: 10,),
                                            Text("RS : ${widget.hoteldetails.offerAmount}", style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        _textForm(
                                            quantity,
                                            // (v) => context
                                            // .read<VoucherListBloc>()
                                            // .add(VoucherListEvent.quantityChanged(v)),
                                            "Quantity",
                                            true,
                                            TextInputType.number,
                                            maxLine: 1,
                                            hint: "Quantity"),
                                        thickSpace,
                                        thickSpace,
                                        SizedBox(
                                          height: 50,
                                          width: screenWidth,
                                          child: ElevatedButton(
                                            onPressed: (){
                                              roomrate= widget.hoteldetails.roomRate.toString();
                                              offeramount=widget.hoteldetails.offerAmount.toString();
                                              // context
                                              //     .read<HotelListBloc>()
                                              //     .add(HotelListEvent.LoadVouchers());
                                              Get.to(() => VoucherlistScreen(
                                                  hoteldetails:widget.hoteldetails
                                              ));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                            ),
                                            child: const Text('Continue'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                        _offerWidget()
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                context
                                    .read<HotelListBloc>()
                                    .add(const HotelListEvent.LoadHotels());
                              }),
                            );
                          }),
                          serverError: ((value) {
                            return SizedBox(
                              height: screenHeight - 180,
                              child: CommonApiErrorWidget(
                                  "Server Error \n${value.errorCode}", () {
                                context
                                    .read<HotelListBloc>()
                                    .add(const HotelListEvent.LoadHotels());
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
                                    .read<HotelListBloc>()
                                    .add(const HotelListEvent.LoadHotels());
                              }),
                            );
                          },
                          unAuthorized: (value) => SizedBox(
                            height: screenHeight - 180,
                            child: CommonApiErrorWidget(value.message, () {
                              context
                                  .read<HotelListBloc>()
                                  .add( HotelListEvent.LoadHotels());
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
    );
  }

  Widget _cardWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            "${widget.hoteldetails.name!.toUpperCase()}",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          SizedBox(height: 20,),
          Text(
            "Validity: 365 Days from the date of activation", style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black),),
          SizedBox(height: 20,),

          Row(
            children: [
              Text("RS : ${widget.hoteldetails.roomRate}",
                style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.lineThrough,),),
              SizedBox(width: 10,),
              Text("RS : ${widget.hoteldetails.offerAmount}", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),),
            ],
          ),
          SizedBox(height: 20,),
          _textForm(
              quantity,
                  // (v) => context
                  // .read<VoucherListBloc>()
                  // .add(VoucherListEvent.quantityChanged(v)),
              "Quantity",
              true,
              TextInputType.number,
              maxLine: 1,
              hint: "Quantity"),
          thickSpace,
          thickSpace,
          SizedBox(
            height: 50,
            width: screenWidth,
            child: ElevatedButton(
              onPressed: (){
                roomrate= widget.hoteldetails.roomRate.toString();
                offeramount=widget.hoteldetails.offerAmount.toString();
                context
                    .read<HotelListBloc>()
                    .add(HotelListEvent.LoadVouchers());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _offerWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.local_offer_outlined),
              SizedBox(width: 10,),
              Text("${widget.hoteldetails.offerTitle}", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textForm(TextEditingController controller,
      // onChanged,
      String label,
      bool editable,
      TextInputType keyboardType, {
        List<TextInputFormatter>? formatter,
        String? hint,
        int maxLine = 1,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        thickSpace,
        TextFormField(
          enabled: editable,
          controller: controller,
          maxLines: maxLine,
          // onChanged: onChanged,
          keyboardType: keyboardType,
          inputFormatters: formatter,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black87),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black54),
            //filled: true,
            border: InputBorder.none,
            fillColor: primaryColor[100],
          ),
        ),
      ],
    );
  }
}
