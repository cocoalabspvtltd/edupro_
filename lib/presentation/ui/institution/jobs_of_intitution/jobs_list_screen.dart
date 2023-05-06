import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/presentation/ui/institution/jobs_of_intitution/widgets/view_job_details.dart';


class InsistutionJobslistScreen extends StatelessWidget {
  final bool fromHome;

  const InsistutionJobslistScreen({super.key, this.fromHome = true});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme("Jobs"),
      body:  Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 4,
              );
            },
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 1,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(7))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ListTile(
                      // selected: selectedIndex == index ? true : false,
                      isThreeLine: true,
                      leading:  Container(
                          width: screenWidth * .14,
                          height: screenWidth * .14,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: UserDetailsLocal.storageBaseUrl +
                                  'assets/icons/drawer_icons/display-picture-sltd.png',
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
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Company Name',
                              style: TextStyle(fontSize: 18,
                                  color:
                                  Colors.black
                              )),
                          const SizedBox(height: 5,),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 18, color: Colors.black,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:Colors.pink[300],
                                child: IconButton(
                                  onPressed: () {

                                  },
                                  icon: const Icon(Icons.edit,
                                    color: Colors.white, size: 15,),
                                ),
                              ),
                              const SizedBox(width: 7,),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.blueAccent,
                                child: IconButton(
                                  onPressed: () {
                                    Get.to(() => ViewJobsDetailsScreen(
                                        // studentdetails:res.studentList![index]
                                    ));
                                  },
                                  icon: const Icon(Icons.remove_red_eye,
                                    color: Colors.white, size: 15,),
                                ),
                              ),
                              const SizedBox(width: 7,),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.red,
                                child: IconButton(
                                  onPressed:() {
                                    // StudenyEmail= res
                                    //     .studentList![index]
                                    //     .email!;
                                    // context
                                    //     .read<
                                    //     StudentDeletionBloc>()
                                    //     .add(
                                    //     StudentDeletionEvent
                                    //         .saveAndUpdatePressed(
                                    //     ))
                                    // ;
                                  }, style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),

                                  icon: const Icon(Icons.delete,
                                    color: Colors.white, size: 15,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),));
            },
          ),
        ],
      ),
    );
  }
}
