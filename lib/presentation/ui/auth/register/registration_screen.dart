import 'package:pgs_edupro/application/auth/login_bloc/log_in_bloc.dart';
import 'package:pgs_edupro/application/payment/payment_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/payment/payment_repository.dart';
import 'package:pgs_edupro/presentation/ui/auth/register/registeration_instructor_screen.dart';
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
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) => SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/splash/splash.png',
                    height: 200,
                    fit: BoxFit.fitHeight,
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
          backgroundColor: Colors.black,
          title: Text(
            "Register",
            style: boldValuePrimaryColor,
          ),
        ),
        body: BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/register_icons/backgroundnew.jpg"),
                fit: BoxFit.cover,
              ),
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
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Image.asset(
                        'assets/icons/register_icons/institution.png',
                        height: 120,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          BlocProvider<LogInBloc>.value(
                            value: logInBloc,
                            child: RegisterationInstructorScreen(userStatus: "individual_instructor",),

                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Image.asset(
                        'assets/icons/register_icons/instructor.png',
                        height: 105,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 40
                  ),
                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        BlocProvider<LogInBloc>.value(
                          value: logInBloc,
                          child: RegistrationScreen(),
                        ),
                      ),
                    );
                  },
                    child:Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Image.asset(
                        'assets/icons/register_icons/student.png',
                        height: 130,
                        color: Colors.white,
                      ),
                    ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
