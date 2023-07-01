import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:flutter/material.dart';

class CommonApiErrorWidget extends StatelessWidget {
  final String text;
  final Function() buttonHandler;
  final Color textColorReceived;
  const CommonApiErrorWidget(this.text, this.buttonHandler,
      {super.key, this.textColorReceived = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Image(
          image: const AssetImage('assets/images/server_error.png'),
          height: MediaQuery.of(context).size.height * .20,
          width: MediaQuery.of(context).size.width * .40,
        ),
        Container(
          alignment: FractionalOffset.center,
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColorReceived,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 8),
        MaterialButton(
          height: 40,
          color: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: buttonHandler,
          child: Container(
            padding: const EdgeInsets.fromLTRB(
              30,
              0,
              30,
              0,
            ),
            child: const Text(
              "Retry",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
