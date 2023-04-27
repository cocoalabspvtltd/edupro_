import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgs_edupro/application/crowd_bloc.dart';
import 'package:pgs_edupro/application/institution_class/institution_class_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/remote_data/repositories/course/course_repository.dart';
import 'package:pgs_edupro/presentation/crowd_funidng/donation_screen.dart';
import 'package:pgs_edupro/presentation/ui/institution/classes_of_institution/widgets/add_classes_form.dart';

import '../../infrastructure/remote_data/repositories/bid_products/bids_repository.dart';

class Doante extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const Doante({Key? key, this.formKey,}) : super(key: key);

  @override
  State<Doante> createState() => _DoanteState();
}

class _DoanteState extends State<Doante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.orangeAccent,
        appBar: appBarTheme("Crowd Funding"),
        body: BlocProvider(create: (_)=>CrowdBloc(BidsRepository()),
          child: SingleChildScrollView(
              child: CrowdFunding()),)
    );
  }

}
