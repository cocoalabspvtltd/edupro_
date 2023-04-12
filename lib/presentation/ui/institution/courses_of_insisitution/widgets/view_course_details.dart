import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/insistutionResponse.dart';

class ViewCourseDetailsCreen extends StatefulWidget {
  final Course coursedetails;
  const ViewCourseDetailsCreen({super.key, required this.coursedetails});

  @override
  State<ViewCourseDetailsCreen> createState() =>
      _ViewCourseDetailsCreenState();
}

class _ViewCourseDetailsCreenState extends State<ViewCourseDetailsCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Course  details',style: boldValuePrimaryColor,),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shadowColor: primaryColor[300],
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(
                            fontSize: 19,fontWeight: FontWeight.w500),
                      ),
                      thickSpace,
                      thickSpace,
                      Text(
                        "Hello I am ${widget.coursedetails.title} ",
                        style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                      thickSpace,
                      Text("${widget.coursedetails.description}"),
                      thickSpace,
                    ],
                  ),
                ),
              ),
            ),
            thickSpace,
            Text("Personal Details",style: boldHeading,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shadowColor: primaryColor[300],
                elevation: 4,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    thickSpace,
                    SizedBox(
                      width: screenWidth,
                      child: Padding(
                        padding:
                        const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 140,
                                height: 140,
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl:UserDetailsLocal.storageBaseUrl+'${widget.coursedetails.courseThumbnail}',
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) => CircleAvatar(
                                      radius: 46.0,
                                      backgroundImage:
                                      AssetImage('assets/icons/profile_icons/person.png'),
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            thickSpace,
                            Row(children: [
                              Icon(Icons.email_outlined,color: primaryColor,),
                              SizedBox(width: 10,),
                              Text("${widget.coursedetails.instructor}",style: details,)
                            ],),
                            thickSpace,
                            thickSpace,
                            thickSpace,
                            thickSpace,
                          ],
                        ),
                      ),
                    ),
                    thickSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
