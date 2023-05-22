import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/bid_products/bid_products_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_instructor_response.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';

class BidInstructionScreen extends StatelessWidget {
   BidInstructionScreen({Key? key}) : super(key: key);
  List numbering =  List.generate(10, (number) => (number + 1).toString());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.05,
      child: BlocProvider(
        create: (_) => BidProductsBloc(BidsRepository())
          ..add(const BidProductsEvent.LoadBidInstrctions()),
        child: Container(
          child: BlocBuilder<BidProductsBloc, BidProductsState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  return context
                      .read<BidProductsBloc>()
                      .add(const BidProductsEvent.LoadBidInstrctions());
                },
                child: SizedBox(
                  height: screenHeight,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: state.map(
                      initial: (_) => Container(),
                      loadInProgress: (_) => SizedBox(
                        height: screenHeight * 0.05,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      loadSuccess: (state) {
                        BidInstructionsResponse res = state.response;
                        return res.instructions == null
                            ? SizedBox(
                            height: screenHeight * 0.05, //!fromHome ? screenHeight : 300,
                            width: screenWidth,
                            child: const CommonResultsEmptyWidget())
                            : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: res.instructions!.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Step${numbering[index]}",style: TextStyle(fontWeight: FontWeight.bold,),),
                                    SizedBox(height: 7),
                                    AutoSizeText("${res.instructions![index].title}",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              );
                            },
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
}
