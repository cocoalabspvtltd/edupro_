import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/insistution/class_list_response.dart';

class ViewClassDetailsScreen extends StatefulWidget {
  final ClassList classesdetails;
  const ViewClassDetailsScreen({super.key, required this.classesdetails});

  @override
  State<ViewClassDetailsScreen> createState() =>
      _ViewClassDetailsScreenState();
}

class _ViewClassDetailsScreenState extends State<ViewClassDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Class details',style: boldValuePrimaryColor,),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),

              Text("Class Details",style: boldHeading,),
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
                                      imageUrl:UserDetailsLocal.storageBaseUrl+'${widget.classesdetails.videoThumbnail}',
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
                                Icon(Icons.collections_bookmark_sharp,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.classesdetails.course}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.person_outline,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.classesdetails.instructorName}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.business_sharp,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.classesdetails.instituteName}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.cast_for_education,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.classesdetails.department}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.timelapse,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.classesdetails.videoDuration}",style: details,)
                              ],),
                              thickSpace,
                              Row(children: [
                                Icon(Icons.video_collection_outlined,color: primaryColor,),
                                SizedBox(width: 10,),
                                Text("${widget.classesdetails.videoUrl}",style: details1,)
                              ],),
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
              thickSpace,
              thickSpace,
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
                        thickSpace,
                        Text(
                          "${widget.classesdetails.videoTitle} ",
                          style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        thickSpace,
                        Text('Nice to have back,What an exciting day ! \nget ready and Continue your lessons today',),
                        thickSpace,
                      ],
                    ),
                  ),
                ),
              ),
              thickSpace,
            ],
          ),
        ),
      ),
    );
  }
}
