// // To parse this JSON data, do
// //
// //     final myCourseResponse = myCourseResponseFromJson(jsonString);

// import 'dart:convert';

// MyCourseResponse myCourseResponseFromJson(String str) =>
//     MyCourseResponse.fromJson(json.decode(str));

// class MyCourseResponse {
//   MyCourseResponse({
//     this.myCourseList,
//     this.message,
//     this.status,
//   });

//   List<List<MyCourseList>>? myCourseList;
//   String? message;
//   bool? status;

//   factory MyCourseResponse.fromJson(Map<String, dynamic> json) =>
//       MyCourseResponse(
//         myCourseList: List<List<MyCourseList>>.from(json["list"].map((x) =>
//             List<MyCourseList>.from(x.map((x) => MyCourseList.fromJson(x))))),
//         message: json["message"],
//         status: json["status"],
//       );
// }

// class MyCourseList {
//   MyCourseList({
//     this.id,
//     this.title,
//     this.description,
//     this.category,
//     this.amount,
//     this.url,
//     this.embadedUrl,
//     this.duration,
//     this.courseThumbnail,
//   });

//   int? id;
//   String? title;
//   String? description;
//   String? category;
//   String? amount;
//   String? url;
//   String? embadedUrl;
//   String? duration;
//   String? courseThumbnail;

//   factory MyCourseList.fromJson(Map<String, dynamic> json) => MyCourseList(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         category: json["category"],
//         amount: json["amount"],
//         url: json["url"],
//         embadedUrl: json["embaded_url"],
//         duration: json["duration"],
//         courseThumbnail: json["course_thumbnail"],
//       );
// }
