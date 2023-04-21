import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';

class ViewInstructorDetailsCreen extends StatefulWidget {
  final Instructors instructordetails;
  const ViewInstructorDetailsCreen({super.key, required this.instructordetails});

  @override
  State<ViewInstructorDetailsCreen> createState() =>
      _ViewInstructorDetailsCreenState();
}

class _ViewInstructorDetailsCreenState extends State<ViewInstructorDetailsCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Instructor details',style: boldValuePrimaryColor,),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  thickSpace,
                  Row(
                    children: [
                      Container(
                          width: screenWidth * .3,
                          height: screenWidth * 0.6,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: UserDetailsLocal.storageBaseUrl +
                                  '${widget.instructordetails.displayPicture}',
                              placeholder: (context, url) => Container(
                                margin: const EdgeInsets.all(1),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    margin: const EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover)),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Container(
                                    width: screenWidth * .14,
                                    height: screenWidth * .14,
                                    padding: const EdgeInsets.all(5),
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/icons/drawer_icons/display-picture-sltd.png'),
                                      height: double.infinity,
                                      width: double.infinity,
                                    ),
                                  ),
                            ),
                          )),
                      SizedBox(width:10,),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.instructordetails.name!.toUpperCase()}"),
                              thickSpace,
                              Text("${widget.instructordetails.qualification}"),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.email_outlined,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.instructordetails.email}"),
                                ],
                              ),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.call,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.instructordetails.phoneNumber}"),
                                ],
                              ),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.business_outlined,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.instructordetails.instituteName}"),
                                ],
                              ),
                              thickSpace,
                              Row(
                                children: [
                                  Icon(Icons.collections_bookmark_sharp,color: primaryColor,),
                                  SizedBox(width: 10,),
                                  Text("${widget.instructordetails.courses}"),
                                ],
                              ),
                ]
                              ),
                          ),
                      Spacer(),
                    ],
                  ),
                  thickSpace,
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              thickSpace,
              thickSpace,
            ],
          ),
        ),
      ),
    );
  }
}
