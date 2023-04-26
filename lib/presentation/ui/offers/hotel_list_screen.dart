import 'package:cached_network_image/cached_network_image.dart';
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


class HotellistScreen extends StatelessWidget {
  final bool fromHome;

  const HotellistScreen({super.key, this.fromHome = true});

  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotelListBloc(OffersRepository())
        ..add(const HotelListEvent.LoadHotels()),
  child: Scaffold(
      appBar: appBarTheme("Hotels"),
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
                        ?  Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: res.hotelList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: InkWell(
                                onTap: (){
                                  Get.to(() => HotelDetailsScreen(
                                      hoteldetails:res.hotelList![index]
                                  ));
                                },
                                child: Container(
                                    width: screenWidth * .14,
                                    height: screenWidth * 0.45,
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Stack(
                                      children:[
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: UserDetailsLocal.storageBaseUrl +
                                                '${res.hotelList![index].hotelImage}',
                                            placeholder: (context, url) => Container(
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
                                            left:0,
                                            top:0,
                                            //you can use "right" and "bottom" too
                                            child:Container(
                                              height:30,
                                              width:60,
                                              color: Colors.amber,
                                              child: Center(child: Text("${res.hotelList![index].discount} OFF")),
                                            )
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
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
}
