import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as get_x;
import 'package:get/get.dart';
import 'package:pgs_edupro/application/membership/membership_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/membership/membership_repository.dart';
import 'package:pgs_edupro/presentation/ui/home/home_screen.dart';

class MembershipCheckScreen extends StatelessWidget {
  const MembershipCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("type---member${UserDetailsLocal.userStatus}");
    return BlocProvider(
      create: (_) => MembershipBloc(MembershipRepository())
        ..add(const MembershipEvent.loadData()),
      child: BlocListener<MembershipBloc, MembershipState>(
          listener: (context, state) {
            state.loadFailureOrSuccessOption.fold(() {
              return state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container();
            }, (either) {
              return either.fold((failure) {}, (r) {
                get_x.Get.offAll(() => const HomeScreen(),
                    transition: get_x.Transition.fadeIn,
                    duration: const Duration(seconds: 1));
              });
            });
          },
          child: const LoadingWidget()),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: scaffoldBackgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: screenWidth * 9 / 16,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/gif/loaders/ads_loader.gif'))),
              ),
              thickSpace,
              thickSpace,
              Container(
                width: screenWidth,
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/gif/loaders/category_loader.gif"),
                        fit: BoxFit.cover)),
              ),
              thickSpace,
              Container(
                width: screenWidth,
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/gif/loaders/course_loader.gif"),
                        fit: BoxFit.cover)),
              ),
              thickSpace,
              Container(
                width: screenWidth,
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/gif/loaders/course_loader.gif"),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
