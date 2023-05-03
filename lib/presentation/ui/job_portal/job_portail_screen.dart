import 'package:cached_network_image/cached_network_image.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:flutter/material.dart';


class JobPortalScreen extends StatelessWidget {
  final bool fromHome;

   JobPortalScreen({super.key, this.fromHome = true});
  final TextEditingController _searchControl = new TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: SafeArea(
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               InkWell(
                 onTap: (){
                   Navigator.pop(context);
                 },
                   child: Icon(Icons.arrow_back)),
               thickSpace,
               Row(
                 children: [
                   // SizedBox(width: 10,),
                   Text("Hey ${UserDetailsLocal.userName},",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,
                   fontSize: 20),),
                   Spacer(),
                   Icon(Icons.notifications_none_rounded,size: 28,),
                   SizedBox(width: 10,),
                   Container(
                       width: screenWidth * .1,
                       height: screenWidth * .1,
                       padding: const EdgeInsets.all(1),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(100),
                       ),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(100),
                         child: CachedNetworkImage(
                           fit: BoxFit.cover,
                           imageUrl: UserDetailsLocal.storageBaseUrl +
                               UserDetailsLocal.userImageUrl,
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
                 ],
               ),
               SizedBox(height: 8,),
               Text("Looking for a job?",style: TextStyle(color: Colors.black,
                   fontWeight: FontWeight.bold,fontSize: 22),),
             thickSpace,
               Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(12.0),
                 ),
                 child: Container(
                   decoration: BoxDecoration(
                       gradient: LinearGradient(
                         begin: Alignment.topRight,
                         end: Alignment.bottomLeft,
                         colors: [
                           Color(0xFFB226B2),
                           Colors.orange
                         ],
                       ),
                     borderRadius:  BorderRadius.circular(12.0)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         thickSpace,
                          Text("Fast Search",style: TextStyle(color: Colors.white,fontSize: 18),),
                         thickSpace,
                         Text("You can search quickly for \nthe job you want",style: TextStyle(color: Colors.white,fontSize: 15),),
                         thickSpace,
                       SizedBox(
                         height: 50,
                         width: screenWidth * 1,
                         child: Card(
                           elevation: 6.0,
                           child: TextField(
                             style: TextStyle(
                               fontSize: 15.0,
                               color: Colors.black,
                             ),
                             decoration: InputDecoration(
                               contentPadding: EdgeInsets.all(10.0),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20.0),
                                 borderSide: BorderSide(
                                   color: Colors.white,
                                 ),
                               ),
                               enabledBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                   color: Colors.white,
                                 ),
                                 borderRadius: BorderRadius.circular(20.0),
                               ),
                               hintText: "Search..",
                               prefixIcon: Icon(
                                 Icons.search,
                                 color: Colors.black,
                               ),
                               // suffixIcon: Icon(
                               //   Icons.filter_list,
                               //   color: Colors.black,
                               // ),
                               hintStyle: TextStyle(
                                 fontSize: 15.0,
                                 color: Colors.black,
                               ),
                             ),
                             maxLines: 1,
                             controller: _searchControl,
                           ),
                         ),
                       ),
                         thickSpace,
                       ],
                   ),
               ),
                 ),
             ),
             thickSpace,
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   'Popular Jobs',
                   style: TextStyle(
                     fontWeight: FontWeight.w600,
                   ),
                 ),
                 Text('View All', style: TextStyle()),
               ],
             ), 
               PopularJobs(),
             thickSpace,
             Text(
               'Recently Added',
               style:TextStyle(
                 fontWeight: FontWeight.w600,
               ),
             ),
               RecentlyJobs()
             ],
           ),
         ),
       ),
     ),
    );
  }

  Widget PopularJobs() {
    return   Container(
      height:screenHeight / 4,
      width: screenWidth,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount:5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.9,
              width: MediaQuery.of(context).size.width / 1.2,
              child: Card(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 3.0,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Image.asset(
                              "assets/images/home/3.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 6.0,
                          left: 6.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0)),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                " APPLY ",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Company name",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            "Post",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            "Salary",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,)
                      ],
                    ),
                    SizedBox(height: 5.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    //   Container(
    //   height: 175,
    //   child: CarouselSlider.builder(
    //     options: CarouselOptions(
    //       height: 130,
    //       aspectRatio: 16 / 9,
    //       viewportFraction: 0.8,
    //       initialPage: _cardIndex,
    //       enlargeCenterPage: true,
    //       onPageChanged: (index, reason) {
    //         // setState(() {
    //         //   _cardIndex = index;
    //         // });
    //       },
    //     ),
    //     itemCount: 4,
    //     itemBuilder:(BuildContext context, int itemIndex, int pageViewIndex)=>
    //       Container(
    //       width: double.infinity,
    //       margin: EdgeInsets.symmetric(horizontal: 30),
    //       child: Container(
    //         decoration: BoxDecoration(
    //           // boxShadow: BoxShadow(
    //           //
    //           // ),
    //         ),
    //         child: OpenContainer(
    //           transitionType: ContainerTransitionType.fade,
    //           transitionDuration: const Duration(milliseconds: 500),
    //           openColor: Colors.black38,
    //           openElevation: 0,
    //           openBuilder: (context, action) {
    //             return  Text("");
    //           },
    //           closedColor: Colors.transparent,
    //           closedElevation: 0,
    //           closedBuilder: (context, action) {
    //             return Container(
    //               height: 125,
    //               padding: EdgeInsets.all(screenHeight ),
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadiusDirectional.circular(10),
    //               ),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                    "companyName",
    //                     style: TextStyle(color: Colors.black38),
    //                   ),
    //                   const Spacer(),
    //                   Text(
    //                     "Postion",
    //                     style: TextStyle(),
    //                   ),
    //                   SizedBox(height: screenHeight * 0.5),
    //                   Text(
    //                     "location",
    //                     style: TextStyle(),
    //                   ),
    //                 ],
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget RecentlyJobs() {
    return   Container(
      height:screenHeight / 4,
      width: screenWidth,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount:5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.9,
              width: MediaQuery.of(context).size.width / 1.2,
              child: Card(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 3.0,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Image.asset(
                              "assets/images/home/2.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 6.0,
                          left: 6.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0)),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                " APPLY ",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Company name",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            "Post",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            "Salary",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,)
                      ],
                    ),
                    SizedBox(height: 5.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    //   Container(
    //   height: 175,
    //   child: CarouselSlider.builder(
    //     options: CarouselOptions(
    //       height: 130,
    //       aspectRatio: 16 / 9,
    //       viewportFraction: 0.8,
    //       initialPage: _cardIndex,
    //       enlargeCenterPage: true,
    //       onPageChanged: (index, reason) {
    //         // setState(() {
    //         //   _cardIndex = index;
    //         // });
    //       },
    //     ),
    //     itemCount: 4,
    //     itemBuilder:(BuildContext context, int itemIndex, int pageViewIndex)=>
    //       Container(
    //       width: double.infinity,
    //       margin: EdgeInsets.symmetric(horizontal: 30),
    //       child: Container(
    //         decoration: BoxDecoration(
    //           // boxShadow: BoxShadow(
    //           //
    //           // ),
    //         ),
    //         child: OpenContainer(
    //           transitionType: ContainerTransitionType.fade,
    //           transitionDuration: const Duration(milliseconds: 500),
    //           openColor: Colors.black38,
    //           openElevation: 0,
    //           openBuilder: (context, action) {
    //             return  Text("");
    //           },
    //           closedColor: Colors.transparent,
    //           closedElevation: 0,
    //           closedBuilder: (context, action) {
    //             return Container(
    //               height: 125,
    //               padding: EdgeInsets.all(screenHeight ),
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadiusDirectional.circular(10),
    //               ),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                    "companyName",
    //                     style: TextStyle(color: Colors.black38),
    //                   ),
    //                   const Spacer(),
    //                   Text(
    //                     "Postion",
    //                     style: TextStyle(),
    //                   ),
    //                   SizedBox(height: screenHeight * 0.5),
    //                   Text(
    //                     "location",
    //                     style: TextStyle(),
    //                   ),
    //                 ],
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}