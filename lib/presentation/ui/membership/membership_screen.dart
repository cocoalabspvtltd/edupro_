import 'package:pgs_edupro/application/membership/membership_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/membership/membership_repository.dart';
import 'package:pgs_edupro/presentation/widgets/common_result_empty_widget.dart';
import 'package:pgs_edupro/presentation/widgets/common_server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembershipScreen extends StatelessWidget {
  final bool fromHome;
  const MembershipScreen({super.key, this.fromHome = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MembershipBloc(MembershipRepository())
        ..add(const MembershipEvent.loadData()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Membership")),
        body: BlocBuilder<MembershipBloc, MembershipState>(
            builder: (context, state) {
          return state.loadFailureOrSuccessOption.fold(() {
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container();
          }, (either) {
            return either.fold((failure) {
              return failure.map(
                  unexpected: (value) =>
                      CommonApiErrorWidget("Unexpected Error \nTry Again", () {
                        context
                            .read<MembershipBloc>()
                            .add(const MembershipEvent.loadData());
                      }),
                  serverError: (value) =>
                      CommonApiErrorWidget("$value \nTry Again", () {
                        context
                            .read<MembershipBloc>()
                            .add(const MembershipEvent.loadData());
                      }),
                  serverTimeOut: (value) =>
                      CommonApiErrorWidget("Server Timed Out \nTry Again", () {
                        context
                            .read<MembershipBloc>()
                            .add(const MembershipEvent.loadData());
                      }),
                  unAuthorized: (value) =>
                      CommonApiErrorWidget("${value.message} \nTry Again", () {
                        context
                            .read<MembershipBloc>()
                            .add(const MembershipEvent.loadData());
                      }),
                  nullData: (value) => const CommonResultsEmptyWidget());
            }, (r) {
              int? expDate;
              try {
               expDate = DateTime.parse(r.details?.expiryDate ?? '').difference(DateTime.now()).inDays;
              }catch(E){
                expDate = 0;
              }
              return state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      width: screenWidth,
                      height: screenHeight,
                      decoration: BoxDecoration(color: primaryColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Text(
                            "My Suscription",
                            style: TextStyle(
                              color: primaryColor[50],
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: screenWidth - 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor[50]),
                            child: Center(
                              child: Text(
                                '$expDate \nDays Remaining',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          Text(
                            "Started on: ${r.details?.purchasedDate ?? 'no data'}\n\nEnds on: ${r.details?.expiryDate ?? 'no data'}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: primaryColor[100],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    );
            });
          });
        }),
      ),
    );
  }
}
