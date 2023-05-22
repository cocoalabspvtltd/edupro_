import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/bid_products/bid_products_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/bid_products/bid_product_list_reponse.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';


class MyOdersListScreen extends StatelessWidget {
  const MyOdersListScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme("My Orders"),
      body: BlocProvider(
        create: (_) => BidProductsBloc(BidsRepository())
          ..add(const BidProductsEvent.LoadClosedProducts()),
        child: BlocBuilder<BidProductsBloc, BidProductsState>(
          builder: (context, state) {
            return  RefreshIndicator(
              onRefresh: () async {
                return context
                    .read<BidProductsBloc>()
                    .add(const BidProductsEvent.LoadLiveProducts());
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
                      BidProductResponse res = state.response;
                      return res.bidProducts != null
                          ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            thickSpace,
                            ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 4,
                                );
                              },
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: res.bidProducts!.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return ListTile(
                                  isThreeLine: true,
                                  leading: Container(
                                      width: screenWidth * .14,
                                      height: screenWidth * .14,
                                      padding: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: UserDetailsLocal.storageBaseUrl +
                                              '${res.bidProducts![index].productImage}',
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
                                      )),
                                  title: Text("${res.bidProducts![index].name}",style: TextStyle(fontSize: 13),),
                                  subtitle:Row(
                                    children: [
                                      Icon(Icons.circle,size: 12,color: Colors.green,),
                                      SizedBox(width: 6,),
                                      Text("Delivered on 12 January,2023",style: TextStyle(fontSize: 12)),
                                    ],
                                  ) ,
                                  trailing: Icon(Icons.arrow_forward_ios_outlined,size: 15,color: Colors.grey[700],),
                                );
                              },
                            ),
                          ],
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
                                context.read<BidProductsBloc>().add(
                                    const BidProductsEvent.LoadLiveProducts());
                              }),
                            );
                          }),
                          serverError: ((value) {
                            return SizedBox(
                              height: screenHeight - 180,
                              child: CommonApiErrorWidget(
                                  "Server Error \n${value.errorCode}", () {
                                context.read<BidProductsBloc>().add(
                                    const BidProductsEvent.LoadLiveProducts());
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
                                    const BidProductsEvent.LoadLiveProducts());
                              }),
                            );
                          },
                          unAuthorized: (value) => SizedBox(
                            height: screenHeight - 180,
                            child: CommonApiErrorWidget(value.message, () {
                              context
                                  .read<BidProductsBloc>()
                                  .add(BidProductsEvent.LoadLiveProducts());
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
      ),
    );
  }
}
