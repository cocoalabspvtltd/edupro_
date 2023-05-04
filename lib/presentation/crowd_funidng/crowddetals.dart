import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/crowd_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/crowd_funidng/donation_screen.dart';


import '../../infrastructure/remote_data/repositories/bid_products/bids_repository.dart';
import 'crowd_detail.dart';

class DoanteDetail extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const DoanteDetail({Key? key, this.formKey,}) : super(key: key);

  @override
  State<DoanteDetail> createState() => _DoanteDetailState();
}

class _DoanteDetailState extends State<DoanteDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.orangeAccent,
        appBar: appBarTheme("Crowd Funding Details"),
        body:Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xFFB226B2),
                    Colors.orange]),
            ),child: BlocProvider(create: (_)=>CrowdBloc(BidsRepository()),
          child: const SingleChildScrollView(
              child: CrowdDetailss()),))
    );
  }

}
