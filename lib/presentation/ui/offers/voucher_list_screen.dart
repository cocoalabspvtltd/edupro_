import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/application/Hotel/hotel_list_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/hotel_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/offers/offers_repository.dart';
import 'package:pgs_edupro/presentation/ui/offers/hotel_deatils_screen.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';

class VoucherlistScreen extends StatefulWidget {
  final bool fromHome;
  final HotelList hoteldetails;
  final discount;
  const VoucherlistScreen({super.key, this.fromHome = true,required this.hoteldetails,required this.discount});
  @override
  State<VoucherlistScreen> createState() => _VoucherlistScreenState();
}

class _VoucherlistScreenState extends State<VoucherlistScreen> {
  List offers = ["500", "1000","1500","2000"];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (_) => HotelListBloc(OffersRepository())
        ..add(const HotelListEvent.LoadVouchers()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Vouchers",
            style: boldValuePrimaryColor,
          ),
        ),
        body: BlocBuilder<HotelListBloc, HotelListState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                return context
                    .read<HotelListBloc>()
                    .add(const HotelListEvent.LoadVouchers());
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
                      return res.vouchers != null ||
                          res.vouchers!.isNotEmpty
                          ?  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: screenHeight,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: screenWidth,
                                height: screenHeight * 0.08,
                                child: Card(
                                  color: Colors.lightBlue[100],
                                  child: Center(child: Text("Choose Discount coupons Upto Rs:${widget.discount}",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                                ),
                              ),
                              CarouselSlider.builder(
                                  itemCount: res.vouchers!.length,
                                  options: CarouselOptions(
                                    autoPlay: false,
                                    aspectRatio: 1 / (3 / 2.5),
                                    enableInfiniteScroll: false,
                                    enlargeCenterPage: true,
                                  ),
                                  itemBuilder: (context, index, realIdx) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 20,),
                                        Container(
                                          height: screenWidth - 110,
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
                                                  '${res.vouchers![index].voucherImage}',
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
                                        SizedBox(
                                          height: 50,
                                          child: ListView.separated(
                                              separatorBuilder:
                                                  (BuildContext context, int index) {
                                                return SizedBox(
                                                  width: 3,
                                                );
                                              },
                                              physics: ClampingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: offers.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return SizedBox(
                                                  height: 10,
                                                  width: 100,
                                                  child: Card(
                                                      clipBehavior: Clip.antiAlias,
                                                      elevation: 0,
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color:primaryColor,
                                                              width: 0.6),
                                                          borderRadius: BorderRadius.circular(5)),
                                                      child: ListTile(
                                                        selected:
                                                        selectedIndex == index ? true : false,
                                                        selectedTileColor:primaryColor,
                                                        selectedColor: Colors.white,
                                                        title: Padding(
                                                          padding: const EdgeInsets.only(
                                                              bottom: 15, left: 15),
                                                          child: Text(
                                                            offers[index],
                                                            style: TextStyle(
                                                                color: selectedIndex == index
                                                                    ? Colors.white
                                                                    : Colors.black,fontSize: 15
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: ()  {
                                                          setState(() {
                                                            selectedIndex = index;
                                                          });
                                                        },
                                                      )),
                                                );
                                              }),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    );
                                  }),
                              SizedBox(
                                height: 50,
                                width: screenWidth * 0.5,
                                child: ElevatedButton(
                                  onPressed: (){

                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text('Buy Now'),
                                ),
                              ),
                            ],
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
                                    .add(const HotelListEvent.LoadVouchers());
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
}

