import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/auth/log_in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationEduUserMessage extends StatelessWidget {
  const RegistrationEduUserMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Success'),
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.offAll(() => const LogInScreen());
          return Future.value(true);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              thickSpace,
              thickSpace,
              thickSpace,
              thickSpace,
              Icon(
                Icons.check_circle_outline_outlined,
                color: secondaryColor,
                size: 160,
              ),
              Text(
                "Account Created!",
                style: TextStyle(
                    fontSize: 24,
                    color: secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text(
                'Please Wait 24 Hours For Your Account Verification Before Checking Your Email For First Time Login Verification Code.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              SizedBox(
                height: screenHeight / 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
