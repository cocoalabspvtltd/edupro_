import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/presentation/ui/e_commerce/widgets/category_screen.dart';
import 'package:pgs_edupro/presentation/ui/e_commerce/widgets/product_detail_screen.dart';

class EcommerceHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWithSearchBox(context,size),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Top Categories",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 8,),
              Categories(),
              thickSpace,
              thickSpace,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text("Special for you",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    TextButton(
                      onPressed: (){},
                      child: Text(
                        "More",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 5,)
                  ],
                ),
              ),
              _popularProducts(context,size),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children:[
                    Text("Popular Products",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    TextButton(
                      onPressed: (){},
                      child: GestureDetector(onTap: (){
                        Get.to(() => const ProductDetail());
                      },
                        child: Text("More",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 5,)
                  ],
                ),
              ),
              _popularProducts(context,size),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),

    );
  }

  Widget HeaderWithSearchBox(BuildContext context,Size size) {
    return Container(
       margin: EdgeInsets.only(bottom: 10 * 2),
      height: size.height * 0.25,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom:20,
            ),
            height: size.height * 0.26 - 27,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFB226B2),
                    Colors.orange]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Hi ${UserDetailsLocal.userName} !',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
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
          ),
          Positioned(
            top: 2,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                  SizedBox(width: screenWidth *0.7,),
                  IconButton(onPressed: (){
                  }, icon: Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
                  SizedBox(width: 10,),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.deepPurple.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color:  Colors.deepPurple.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search,color: Colors.deepPurple.withOpacity(0.5),)
                ],
              ),
            ),
          ),
          // SizedBox(height: 15,)
        ],
      ),
    );
  }

  Widget _popularProducts(BuildContext context,Size size){
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height:screenHeight / 4  ,
        width: screenWidth,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 12,
            );
          },
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: InkWell(
                // onTap: (){
                //   Get.to(() =>  JobsDetailsScreen());
                // },
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.9,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Card(
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    elevation: 3.0,
                    child: Column(
                      children:[
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                child: Image.asset(
                                  "assets/images/home/headphone1.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 6.0,
                              left: 6.0,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(Icons.favorite_border,size: 18,),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5,left: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Product name",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Row(
                          children: [
                            SizedBox(width: 5,),
                            Text(
                              "₹1800",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.deepPurple
                              ),
                            ),
                            // Text(
                            //   "500",
                            //   style: TextStyle(
                            //       fontSize: 13.0,
                            //       fontWeight: FontWeight.w500,
                            //       color: Colors.grey
                            //   ),
                            // ),
                            Spacer(),
                            Text(
                              "4.5★",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.green
                              ),
                            ),
                            SizedBox(width: 7,)
                          ],
                        ),
                        SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

  }
}
