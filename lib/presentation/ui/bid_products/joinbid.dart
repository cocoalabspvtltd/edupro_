import 'package:animate_gradient/animate_gradient.dart';
import 'package:fluid_action_card/FluidActionCard/fluid_action_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pgs_edupro/domain/core/constants.dart';

class JoinBid extends StatefulWidget {
  const JoinBid({Key? key}) : super(key: key);

  @override
  State<JoinBid> createState() => _JoinBidState();
}

class _JoinBidState extends State<JoinBid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarTheme("Join Here"),
        body: SingleChildScrollView(
            child: Column(children: [
          Image.asset("assets/images/home/friendship.png"),
          thickSpace,
          thickSpace,
          thickSpace,
          thickSpace,
        const   Text(
            "You can now join here by Adding 1 Rupee\n This Product is yours",
            style: TextStyle(color: Colors.black,fontFamily: "Pacifico",fontSize: 15),
          ),
              thickSpace,
              thickSpace,
              thickSpace,
              thickSpace,
              Container(
                height: 100,
                width: screenWidth * 0.44,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(45)),
                child: AnimateGradient(
                  primaryBegin: Alignment.topLeft,
                  primaryEnd: Alignment.bottomLeft,
                  secondaryBegin: Alignment.bottomLeft,
                  secondaryEnd: Alignment.topRight,
                  primaryColors: const [
                    Colors.deepOrange,
                    Colors.orangeAccent,
                    Colors.purpleAccent,
                  ],
                  secondaryColors: const [
                    Colors.deepOrange,
                    Colors.purpleAccent,
                    Colors.purple,
                  ],
                  child: Center(
                      child: Row(
                        children: const [


                              Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left:56.0),
                                    child: Text(
                                      'Pay ₹ 1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Pacifico",
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                  )),


                        ],
                      )),
                ),
                //
              ),
        ])));
  }
}
