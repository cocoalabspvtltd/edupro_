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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children:[
                    Text("Popular Products",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    TextButton(
                      onPressed: (){},
                      child: GestureDetector(onTap: (){
                        Get.to(() => const ProductDetail(

                        ));
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),

    );
  }

  Widget HeaderWithSearchBox(BuildContext context,Size size) {
    return Container(
       margin: EdgeInsets.only(bottom: 20 * 2.5),
      height: size.height * 0.26,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom:20,
            ),
            height: size.height * 0.27 - 27,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xFFB226B2),
                    Colors.orange]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
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
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back,color: Colors.white,))),
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
                children: <Widget>[
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
}
