import 'package:flutter/material.dart';
import 'package:pgs_edupro/domain/core/constants.dart';

class ViewJobsDetailsScreen extends StatefulWidget {
  const ViewJobsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ViewJobsDetailsScreen> createState() => _ViewJobsDetailsScreenState();
}

class _ViewJobsDetailsScreenState extends State<ViewJobsDetailsScreen> with TickerProviderStateMixin  {
  static const List<Tab> _tabs = [
    Tab(
      icon: Icon(Icons.file_copy_outlined),
    ),
    Tab(
      icon:  Icon(Icons.museum_outlined),
    ),
    Tab(
      icon:  Icon(Icons.alarm),
    ),
  ];
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme("Job details"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            // _ourPeople(context),
            // _apply(context)
          ],
        ),
      ),
    );
  }
  Widget _header(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            thickSpace,
            Row(
              children: [
                Image.asset("assets/icons/register_icons/institution.png", height: 40,color: Colors.black,),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gitlab",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "UX Designer",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 32),
            Row(
              children: [
                SizedBox(width: 20,),
                _headerStatic("Salary", "\$85,000"),
                SizedBox(width: 20,),
                _headerStatic("Applicants", "45"),
                SizedBox(width: 20,),
                _headerStatic("Location","Kochi"),
              ],
            ),
            thickSpace,
            thickSpace,
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.05,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.deepPurple[500],
                indicatorColor:Colors.deepPurple[500] ,
                tabs: _tabs,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 2,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    _jobDescription(context),
                    _comapnyDescription(context),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time and Rules",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(Icons.alarm),
                              SizedBox(width: 8,),
                              Text("9 Am to 6 Pm"),
                            ],
                          )
                          // TextButton(
                          //   onPressed: () {},
                          //   style: ButtonStyle(
                          //       padding: MaterialStateProperty.all(EdgeInsets.zero)),
                          //   child: Text("Learn more",
                          //       style: TextStyle(fontSize: 14, color: Colors.grey)),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerStatic(String title, String sub) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            sub,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _jobDescription(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Job Description",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "You will be Gitlab's dedicated UI/Ux designer, reporting to the chief Technology Officer. You will come up with the user experience for few product features, including developing conceptual design to test with clients and then. Share the...",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          // TextButton(
          //   onPressed: () {},
          //   style: ButtonStyle(
          //       padding: MaterialStateProperty.all(EdgeInsets.zero)),
          //   child: Text("Learn more",
          //       style: TextStyle(fontSize: 14, color: Colors.grey)),
          // )
        ],
      ),
    );
  }

  Widget _comapnyDescription(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Company Name",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "You will be Gitlab's dedicated UI/Ux designer, reporting to the chief Technology Officer. You will come up with the user experience for few product features, including developing conceptual design to test with clients and then. Share the...",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }

  // Widget _ourPeople(BuildContext context) {
  //   return Container(
  //     height: 92,
  //     padding: EdgeInsets.only(left: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text("Our People",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
  //         SizedBox(height: 12),
  //         Expanded(
  //           child: ListView(
  //             scrollDirection: Axis.horizontal,
  //             children: [
  //               _people(context, img:"assets/images/user1.png" , name: "J.Sumith"),
  //               _people(context, img: "assets/images/user2.png", name: "L.James"),
  //               _people(context, img: "assets/images/user1.png", name: "Anna"),
  //               _people(context, img: "assets/images/user2.png", name: "Mathew"),
  //               _people(context, img: "assets/images/user1.png", name: "Tom Joe"),
  //               _people(context, img: "assets/images/user1.png", name: "Angle"),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _people(BuildContext context, {required String img, required String name}) {
  //   return Container(
  //     margin: EdgeInsets.only(right: 18),
  //     child: Column(
  //       children: [
  //         CircleAvatar(
  //           backgroundImage: AssetImage(img),
  //         ),
  //         SizedBox(height: 8),
  //         Text(name, style: TextStyle(fontSize: 10, color:Colors.blue)),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _apply(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 16),
  //     margin: EdgeInsets.only(top: 54),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: TextButton(
  //             style: ButtonStyle(
  //                 backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
  //                 padding: MaterialStateProperty.all(
  //                     EdgeInsets.symmetric(vertical: 16))),
  //             onPressed: () {},
  //             child: Text(
  //               "Apply Now",
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ),
  //         SizedBox(width: 12),
  //         SizedBox(
  //           height: 50,
  //           width: 60,
  //           child: OutlinedButton(
  //             onPressed: () {},
  //             style: ButtonStyle(
  //               side: MaterialStateProperty.all(
  //                 BorderSide(color:Colors.deepPurple),
  //               ),
  //             ),
  //             child: Icon(
  //               Icons.bookmark_border,
  //               color: Colors.deepPurple,
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
