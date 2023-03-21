import 'package:pgs_edupro/application/auth/auth_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/shared_prefs.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/presentation/ui/auth/log_in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as get_x;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pgs_edupro/presentation/ui/membership_check_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setScreenDimensions(context);

      setState(() {});
      if (UserDetailsLocal.apiToken.isEmpty) await SharedPrefs.init();
      await SharedPrefs.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
            initial: (_) {},
            authenticated: (_) async =>
                Future.delayed(const Duration(seconds: 1)).then((value) =>
                    get_x.Get.offAll(() => const MembershipCheckScreen(),
                        transition: get_x.Transition.zoom,
                        duration: const Duration(seconds: 1))),
            unauthenticated: (_) async =>
                Future.delayed(const Duration(seconds: 1)).then((value) =>
                    get_x.Get.off(() => const LogInScreen(),
                        transition: get_x.Transition.zoom,
                        duration: const Duration(seconds: 1))));
        // Navigator.push(
        //     context,
        //     PageTransition(
        //         duration: Duration(seconds: 1),
        //         type: PageTransitionType.fade,
        //         child: LogInScreen()))));
      },
      child: _PageWidget(),
    );
  }
}

class _PageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/splash/pg logo.png",
                fit: BoxFit.fitWidth,
                width: screenWidth / 2,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'Powered by',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: primaryColor[600]),
              ),
              const SizedBox(height: 8),
              Text(
                'Cocoalabs India Pvt. Ltd.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor[600],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder<String>(
                  future: _getAppVersion(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    String version = '';
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      version = snapshot.data == null
                          ? ''
                          : 'Version : ${snapshot.data}';
                    }
                    return Text(
                      version,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primaryColor[600]),
                    );
                  }),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
