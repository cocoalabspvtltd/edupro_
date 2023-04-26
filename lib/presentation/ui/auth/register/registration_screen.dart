import 'package:pgs_edupro/application/auth/login_bloc/log_in_bloc.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/payment/payment_repository.dart';
import 'package:pgs_edupro/presentation/ui/auth/register/registeration_instructor_screen.dart';
import 'package:pgs_edupro/presentation/ui/auth/register/registration_institution_screen.dart';
import 'package:pgs_edupro/presentation/ui/auth/register/widgets/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentBloc(PaymentRepository()),
      child: Scaffold(
        appBar:AppBar(
          // backgroundColor: Color(0xFFB226B2),
          flexibleSpace:  Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xFFB226B2),
                    Colors.orange]),
            ),
          ),
          title:Text(
            "Student Register",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontSize: 30,
                fontWeight: FontWeight.w200),

          ),
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) => SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/icons/register_icons/student.png',
                    height: 150,
                    color:  Colors.orangeAccent,

                  ),
                  RegistrationForm(
                    formKey: formKey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationTypeScreen extends StatefulWidget {
  const RegistrationTypeScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationTypeScreen> createState() => _RegistrationTypeScreenState();
}

class _RegistrationTypeScreenState extends State<RegistrationTypeScreen> {

  late LogInBloc logInBloc;
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    logInBloc = BlocProvider.of<LogInBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentBloc(PaymentRepository()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color(0xFFB226B2),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Register",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontSize: 30,
                fontWeight: FontWeight.w200),

          ),
        ),
        body: BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
                gradient:LinearGradient(
                    colors: [
                      Color(0xFFB226B2),
                      Colors.orange
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
              // image: DecorationImage(
              //   image: AssetImage("assets/icons/register_icons/backgroundnew.jpg"),
              //   fit: BoxFit.cover,
              // ),
            ),
            height: screenHeight,
            width: screenWidth,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(height: 150,width: 150,
                    child: ElevatedButton(
                      onPressed: () {        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          BlocProvider<LogInBloc>.value(
                            value: logInBloc,
                            child: RegisterationInstitutionScreen(userStatus: "institution",),

                          ),
                        ),
                      );},
                      child: Container(height: 100,width: 100,
                          child: Image.asset("assets/icons/register_icons/institution.png")),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder()),
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                        backgroundColor: MaterialStateProperty.all(Colors.orange), // <-- Button color
                        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                          if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
                        }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(height: 150,width: 150,
                    child: ElevatedButton(
                      onPressed: () {                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          BlocProvider<LogInBloc>.value(
                            value: logInBloc,
                            child: RegisterationInstructorScreen(userStatus: "individual_instructor",),

                          ),
                        ),
                      );},
                      child: Container(height: 100,width: 100,
                          child: Image.asset("assets/icons/register_icons/instructor.png")),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder()),
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                        backgroundColor: MaterialStateProperty.all(Colors.orange), // <-- Button color
                        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                          if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
                        }),
                      ),
                    ),
                  ),

                  SizedBox(
                      height: 50
                  ),
                  Container(height: 150,width: 150,
                    child: ElevatedButton(
                      onPressed: () {               Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          BlocProvider<LogInBloc>.value(
                            value: logInBloc,
                            child: RegistrationScreen(),
                          ),
                        ),
                      );},
                      child: Container(height: 100,width: 100,
                          child: Image.asset("assets/icons/register_icons/student.png")),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder()),
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                        backgroundColor: MaterialStateProperty.all(Colors.orange), // <-- Button color
                        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                          if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
                        }),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
