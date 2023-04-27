import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pgs_edupro/application/crowd_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';

import 'package:pgs_edupro/infrastructure/remote_data/models/crowd.dart';

import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../../infrastructure/remote_data/repositories/bid_products/bids_repository.dart';

class CrowdFunding extends StatelessWidget {
  const CrowdFunding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CrowdBloc(BidsRepository())
        ..add(const CrowdEvent.LoadCrowdProducts()),
      child: BlocBuilder<CrowdBloc, CrowdState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              return context
                  .read<CrowdBloc>()
                  .add(const CrowdEvent.LoadCrowdProducts());
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
                    CrowdFundingResponse res = state.response;

                    return res.organization != null
                        ? Column(
                            children: [
                              thickSpace,
                              CarouselSlider.builder(
                                  itemCount: res.organization!.length,
                                  options: CarouselOptions(
                                    autoPlay: false,
                                    aspectRatio: 1 / (5 / 3),
                                    enableInfiniteScroll: false,
                                    enlargeCenterPage: true,
                                  ),
                                  itemBuilder: (context, index, realIdx) {
                                    return Card(
                                      elevation: 50,
                                      shadowColor: Colors.black,
                                      color: Colors.white,
                                      child: SizedBox(
                                        width: 400,
                                        height: 500,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                          Text(
                                          "${res.organization![index].title}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Pacifico'),
                                          ),
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.purpleAccent,
                                                radius: 108,
                                                child: const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/images/images.jpg"),
                                                  //NetworkImage
                                                  radius: 100,
                                                ), //CircleAvatar
                                              ), //CircleAvatar
                                              const SizedBox(
                                                height: 10,
                                              ), //SizedBox

                                              LinearPercentIndicator(
                                                //leaner progress bar
                                                animation: true,
                                                animationDuration: 1000,
                                                lineHeight: 20.0,
                                                percent: 50 / 100,
                                                center: Text(
                                                  10.toString() + "%",
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                linearStrokeCap:
                                                    LinearStrokeCap.roundAll,
                                                progressColor: Colors.purpleAccent,
                                                backgroundColor:
                                                    Colors.grey[300],
                                              ),
                                              //Text
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "₹ ${res.organization![index].raisedAmount}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Pacifico'),
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                    "raised out of ",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                    "₹ ${res.organization![index].goalAmount}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Pacifico'),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: const [
                                                      Text(
                                                        "Beneficiary Name",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Pacifico'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Anjana Murugan",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Sigmar'),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 7,
                                                  ),

                                                  const SizedBox(
                                                    width: 88,
                                                  ),
                                                  Column(
                                                    children: const [
                                                      Text(
                                                        "Created By",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Pacifico'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Edupro ",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Sigmar'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:20),
                                              Text(
                                                "${res.organization![index].description}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Pacifico'),
                                              ),//Text
                                              const SizedBox(
                                                height: 20,
                                              ), //SizedBox
                                              SizedBox(
                                                width: 150,

                                                child: ElevatedButton(
                                                  onPressed: () => 'Null',
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .purpleAccent)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    child: Row(
                                                      children: const [
                                                        Icon(Icons.touch_app),
                                                        Text('    Donate Now')
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // RaisedButton is deprecated and should not be used
                                                // Use ElevatedButton instead

                                                // child: RaisedButton(
                                                //   onPressed: () => null,
                                                //   color: Colors.green,
                                                //   child: Padding(
                                                //     padding: const EdgeInsets.all(4.0),
                                                //     child: Row(
                                                //       children: const [
                                                //         Icon(Icons.touch_app),
                                                //         Text('Visit'),
                                                //       ],
                                                //     ), //Row
                                                //   ), //Padding
                                                // ), //RaisedButton
                                              ) //SizedBox
                                            ],
                                          ), //Column
                                        ), //Padding
                                      ), //SizedBox
                                    ); //Card
                                    //Center;
                                  }),
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
                                  .read<CrowdBloc>()
                                  .add(const CrowdEvent.LoadCrowdProducts());
                            }),
                          );
                        }),
                        serverError: ((value) {
                          return SizedBox(
                            height: screenHeight - 180,
                            child: CommonApiErrorWidget(
                                "Server Error \n${value.errorCode}", () {
                              context
                                  .read<CrowdBloc>()
                                  .add(const CrowdEvent.LoadCrowdProducts());
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
                                  .read<CrowdBloc>()
                                  .add(const CrowdEvent.LoadCrowdProducts());
                            }),
                          );
                        },
                        unAuthorized: (value) => SizedBox(
                              height: screenHeight - 180,
                              child: CommonApiErrorWidget(value.message, () {
                                context
                                    .read<CrowdBloc>()
                                    .add(CrowdEvent.LoadCrowdProducts());
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
    );
  }
}
