import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/application/Hotel/hotel_list_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/hotel_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/offers/offers_repository.dart';
import 'package:pgs_edupro/presentation/ui/offers/hotel_deatils_screen.dart';
import 'package:pgs_edupro/presentation/ui/offers/hotel_listView.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';


class HomeHotellistScreen extends StatelessWidget {
  final bool fromHome;

  const HomeHotellistScreen({super.key, this.fromHome = true});

  @override

  Widget build(BuildContext context) {
    return BlocBuilder<HotelListBloc, HotelListState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => !fromHome
              ? SizedBox(
            height: screenHeight,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
              : Container(
            width: screenWidth,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/gif/loaders/category_loader.gif"),
                    fit: BoxFit.cover)),
          ),
          loadSuccess: (state) {
            HotelListResponse res = state.response;
            return res.hotelList!.isNotEmpty
                ? !fromHome
                ?HotelListView(
              hoteldetails: res.hotelList!,
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Buy A Card ",
              style: TextStyle(fontSize: 18,fontFamily: "Pacifico",
                )),
                thickSpace,
                HotelListView(
                  hoteldetails: res.hotelList!,
                ),
              ],
            )
                : Container();
          },
          loadFailure: (state) {
            return state.networkFailure.map(
                unexpected: ((value) {
                  return CommonApiErrorWidget("Unexpected Error \nTry Again",
                          () {
                        context
                            .read<HotelListBloc>()
                            .add(const HotelListEvent.LoadHotels());
                      });
                }),
                serverError: ((value) {
                  return CommonApiErrorWidget(
                      "Server Error \n${value.errorCode}", () {
                    context
                        .read<HotelListBloc>()
                        .add(const HotelListEvent.LoadHotels());
                  });
                }),
                nullData: ((value) => SizedBox(
                    height: !fromHome ? screenHeight : 200,
                    width: screenWidth,
                    child: const CommonResultsEmptyWidget())),
                serverTimeOut: (value) {
                  return CommonApiErrorWidget("Server Time Out \nTry Again",
                          () {
                        context
                            .read<HotelListBloc>()
                            .add(const HotelListEvent.LoadHotels());
                      });
                },
                unAuthorized: (value) =>
                    CommonApiErrorWidget("Server Time Out \nTry Again", () {
                      context
                          .read<HotelListBloc>()
                          .add(const HotelListEvent.LoadHotels());
                    }));
          },
          loadMoreInProgress: (LoadMoreInProgress value) => Container(),
        );
      },
    );

  }
}
