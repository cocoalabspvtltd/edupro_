import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/my_course/my_courses_response.dart';
import 'package:pgs_edupro/presentation/ui/my_courses/my_course_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCourseListView extends StatelessWidget {
  final List<MyCourseData> myCourseData;
  const MyCourseListView({super.key, required this.myCourseData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: myCourseData.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(
                () => MyCourseDetailsScreen(courseDetails: myCourseData[index]
//                   MyCourseData(
//                     courseId: 1,
//                     title: "The Complete FastAPI Course With Python",
//                     instructors: [
//                       Instructors(
//                         name: "Akshay",
//                         displayPicture: '',
//                         description: """
// ▪ Quick learner and willingness to explore, learn and adapt latest technologies. .
// ▪ Ability to design, build and maintain flutter applications from scratch, with knowledge about basic
// activities involved in the development of cross-platform mobile applications from development to
// production.
// """,
//                         qualification: "MASTER OF PHYSICS, PHD",
//                         instituteName: "BINARY SEQUENCE",
//                       ),
//                       Instructors(
//                         name: "Pooja",
//                         displayPicture: '',
//                         description: """
// ▪ Quick learner and willingness to explore, learn and adapt latest technologies. .
// ▪ Ability to design, build and maintain flutter applications from scratch, with knowledge about basic
// activities involved in the development of cross-platform mobile applications from development to
// production.
// """,
//                         qualification: "B Tech Computer Science",
//                         instituteName: "BINARY SEQUENCE",
//                       )
//                     ],
//                     courseCategory: 'Programmming',
//                     courseThumbnail: '',
//                     courseDuration: '3',
//                     aboutCourse: AboutCourse(
//                       aboutDescription: """
// Learn how to build APIs from scratch using the Python based libraries Flask and FastAPI. You will build plenty of applications and tools such as word dictionary and a google search page based solely on API obtained data.

// The course assumes no prior programming experience. We will provide you with two introductory sections for Python where you will learn all the basics before moving to the API building lessons.

// API stands for Application Programming Interface, a software-to-software interface that enables two applications to exchange data among each other. Each time we use an app like Facebook, send an instant message, or check the weather on our phone, we’re using an API. Simply put, when we use an application on our mobile phone, the application connects to the Internet and sends data to a server. The server then retrieves that data, interprets it, performs the necessary actions and sends us the information we wanted in a readable way — all of this happens via API.

// APIs can be a service for developers. Every time developers write a new program, they don’t have to start from scratch to build a core application that tries to do everything. Instead, they can contract out certain responsibilities by using already created pieces that do the job better.

// """,
//                       aboutTitle:
//                           "Learn RESTful with Python including: Django, Nameko, MongoDB and Flask",
//                     ),
//                   ),
                    ));
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            color: Colors.grey[200],
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: UserDetailsLocal.storageBaseUrl +
                          (myCourseData[index].courseThumbnail!),
                      imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover))),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Image(
                        image: AssetImage(
                            'assets/images/video_thumpnail_error.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                thickSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth - 120,
                        child: Text(
                          myCourseData[index].title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 15,
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const VerticalDivider(
                                  thickness: 1, color: Colors.black54),
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: myCourseData[index].instructors!.length > 2
                              ? 2
                              : myCourseData[index].instructors!.length,
                          itemBuilder: (BuildContext context, int position) {
                            return Text(
                              myCourseData[index].instructors?[position].name ??
                                  '',
                              style: smallText,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Course Duration ${myCourseData[index].courseDuration ?? ''}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: smallText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class InstructorCourseListView extends StatelessWidget {
  final   List<Course>? course;
  const InstructorCourseListView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: course!.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(
                    () => InstructorCourseDetailsScreen(courseDetails: course![index]
//                   MyCourseData(
//                     courseId: 1,
//                     title: "The Complete FastAPI Course With Python",
//                     instructors: [
//                       Instructors(
//                         name: "Akshay",
//                         displayPicture: '',
//                         description: """
// ▪ Quick learner and willingness to explore, learn and adapt latest technologies. .
// ▪ Ability to design, build and maintain flutter applications from scratch, with knowledge about basic
// activities involved in the development of cross-platform mobile applications from development to
// production.
// """,
//                         qualification: "MASTER OF PHYSICS, PHD",
//                         instituteName: "BINARY SEQUENCE",
//                       ),
//                       Instructors(
//                         name: "Pooja",
//                         displayPicture: '',
//                         description: """
// ▪ Quick learner and willingness to explore, learn and adapt latest technologies. .
// ▪ Ability to design, build and maintain flutter applications from scratch, with knowledge about basic
// activities involved in the development of cross-platform mobile applications from development to
// production.
// """,
//                         qualification: "B Tech Computer Science",
//                         instituteName: "BINARY SEQUENCE",
//                       )
//                     ],
//                     courseCategory: 'Programmming',
//                     courseThumbnail: '',
//                     courseDuration: '3',
//                     aboutCourse: AboutCourse(
//                       aboutDescription: """
// Learn how to build APIs from scratch using the Python based libraries Flask and FastAPI. You will build plenty of applications and tools such as word dictionary and a google search page based solely on API obtained data.

// The course assumes no prior programming experience. We will provide you with two introductory sections for Python where you will learn all the basics before moving to the API building lessons.

// API stands for Application Programming Interface, a software-to-software interface that enables two applications to exchange data among each other. Each time we use an app like Facebook, send an instant message, or check the weather on our phone, we’re using an API. Simply put, when we use an application on our mobile phone, the application connects to the Internet and sends data to a server. The server then retrieves that data, interprets it, performs the necessary actions and sends us the information we wanted in a readable way — all of this happens via API.

// APIs can be a service for developers. Every time developers write a new program, they don’t have to start from scratch to build a core application that tries to do everything. Instead, they can contract out certain responsibilities by using already created pieces that do the job better.

// """,
//                       aboutTitle:
//                           "Learn RESTful with Python including: Django, Nameko, MongoDB and Flask",
//                     ),
//                   ),
                ));
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            color: Colors.grey[200],
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: UserDetailsLocal.storageBaseUrl +
                          (course![index].courseThumbnail!),
                      imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover))),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Image(
                        image: AssetImage(
                            'assets/images/video_thumpnail_error.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                thickSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth - 120,
                        child: Text(
                          course![index].title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 15,
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                          const VerticalDivider(
                              thickness: 1, color: Colors.black54),
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: course![index].instructor!.length > 2
                              ? 2
                              : course![index].instructor!.length,
                          itemBuilder: (BuildContext context, int position) {
                            return Text(
                              course![index].instructor ??
                                  '',
                              style: smallText,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Course Duration ${course![index].duration ?? ''}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: smallText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


class InstructorPurcahsedCourseListView extends StatelessWidget {
  final   List<MyCourseData>? course;
  const InstructorPurcahsedCourseListView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: course!.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(
                    () => InstructorPurschaseCourseDetailsScreen(courseDetails: course![index]
//                   MyCourseData(
//                     courseId: 1,
//                     title: "The Complete FastAPI Course With Python",
//                     instructors: [
//                       Instructors(
//                         name: "Akshay",
//                         displayPicture: '',
//                         description: """
// ▪ Quick learner and willingness to explore, learn and adapt latest technologies. .
// ▪ Ability to design, build and maintain flutter applications from scratch, with knowledge about basic
// activities involved in the development of cross-platform mobile applications from development to
// production.
// """,
//                         qualification: "MASTER OF PHYSICS, PHD",
//                         instituteName: "BINARY SEQUENCE",
//                       ),
//                       Instructors(
//                         name: "Pooja",
//                         displayPicture: '',
//                         description: """
// ▪ Quick learner and willingness to explore, learn and adapt latest technologies. .
// ▪ Ability to design, build and maintain flutter applications from scratch, with knowledge about basic
// activities involved in the development of cross-platform mobile applications from development to
// production.
// """,
//                         qualification: "B Tech Computer Science",
//                         instituteName: "BINARY SEQUENCE",
//                       )
//                     ],
//                     courseCategory: 'Programmming',
//                     courseThumbnail: '',
//                     courseDuration: '3',
//                     aboutCourse: AboutCourse(
//                       aboutDescription: """
// Learn how to build APIs from scratch using the Python based libraries Flask and FastAPI. You will build plenty of applications and tools such as word dictionary and a google search page based solely on API obtained data.

// The course assumes no prior programming experience. We will provide you with two introductory sections for Python where you will learn all the basics before moving to the API building lessons.

// API stands for Application Programming Interface, a software-to-software interface that enables two applications to exchange data among each other. Each time we use an app like Facebook, send an instant message, or check the weather on our phone, we’re using an API. Simply put, when we use an application on our mobile phone, the application connects to the Internet and sends data to a server. The server then retrieves that data, interprets it, performs the necessary actions and sends us the information we wanted in a readable way — all of this happens via API.

// APIs can be a service for developers. Every time developers write a new program, they don’t have to start from scratch to build a core application that tries to do everything. Instead, they can contract out certain responsibilities by using already created pieces that do the job better.

// """,
//                       aboutTitle:
//                           "Learn RESTful with Python including: Django, Nameko, MongoDB and Flask",
//                     ),
//                   ),
                ));
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            color: Colors.grey[200],
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: UserDetailsLocal.storageBaseUrl +
                          (course![index].courseThumbnail!),
                      imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover))),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Image(
                        image: AssetImage(
                            'assets/images/video_thumpnail_error.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                thickSpace,
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth - 120,
                        child: Text(
                          course![index].title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // SizedBox(
                      //   height: 15,
                      //   child: ListView.separated(
                      //     separatorBuilder: (BuildContext context, int index) =>
                      //     const VerticalDivider(
                      //         thickness: 1, color: Colors.black54),
                      //     scrollDirection: Axis.horizontal,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: course![index].instructors!.length > 2
                      //         ? 2
                      //         : course![index].instructors!.length,
                      //     itemBuilder: (BuildContext context, int position) {
                      //       return Text(
                      //         course![index]. ??
                      //             '',
                      //         style: smallText,
                      //       );
                      //     },
                      //   ),
                      // ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Course Duration ${course![index].courseDuration ?? ''}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: smallText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}