import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/application/auth/auth_bloc.dart';
import 'package:pgs_edupro/application/membership/membership_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/membership/membership_repository.dart';
import 'package:pgs_edupro/presentation/ui/splash_screen.dart';
import 'infrastructure/remote_data/repositories/auth/server_auth_facade.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future<void>.delayed(const Duration(seconds: 1));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(authFacade: ServerAuthFacade())
            ..add(const AuthEvent.authCheckRequested()),
        ),
        BlocProvider(
          create: (_) => MembershipBloc(MembershipRepository())
            ..add(const MembershipEvent.loadData()),
        )
      ],
      child: ConnectionNotifier(
        disconnectedText: 'Network disconnected, reconnecting...',
        child: GetMaterialApp(
          title: 'Edu Pro',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            primaryColor: primaryColor,
            colorScheme:
                ThemeData(scaffoldBackgroundColor: scaffoldBackgroundColor)
                    .colorScheme
                    .copyWith(primary: primaryColor, secondary: secondaryColor),
            buttonTheme:
                ButtonTheme.of(context).copyWith(buttonColor: primaryColor),
            appBarTheme: AppBarTheme.of(context).copyWith(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              color: secondaryColor,
              foregroundColor: Colors.black,
              elevation: 0,
              titleTextStyle: appBarText,
              iconTheme: IconThemeData(color: scaffoldBackgroundColor),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor)),
            ),
            canvasColor: primaryColor[100],
            visualDensity: VisualDensity.adaptivePlatformDensity,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
            textSelectionTheme:
                TextSelectionThemeData(cursorColor: primaryColor),
            inputDecorationTheme: InputDecorationTheme(
              floatingLabelStyle: TextStyle(color: primaryColor),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.grey)),
              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.black12)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.grey)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.red)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: primaryColor)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.red)),
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            ),
          ),
          routes: {
            '/': (BuildContext context) => const SplashScreen(),
            //'/home': (BuildContext context) => MyHomePage(),
          },
          initialRoute: '/',
          // onGenerateRoute: Router.onGenerateRoute,
          // initialRoute: Router.splashPage,
          // navigatorKey: Router.navigator.key,
        ),
      ),
    );
  }
}
