

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/Hotel/hotel_list_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/offers/hotel_list_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/offers/offers_repository.dart';
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
                        ?  Column(
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
                          itemCount: res.hotelList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                elevation: 1,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                  child: ListTile(
                                    // selected: selectedIndex == index ? true : false,
                                    isThreeLine: true,
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${res.hotelList![index].name} ',
                                            style: TextStyle(fontSize: 18,
                                                color:
                                                Colors.black
                                            )),
                                        const SizedBox(height: 5,),
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${res.hotelList![index].discount} ',
                                          style: TextStyle(
                                            fontSize: 18, color: Colors.black,),
                                        ),
                                      ],
                                    ),
                                  ),));
                          },
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
