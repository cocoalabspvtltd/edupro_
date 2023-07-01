import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pgs_edupro/domain/core/constants.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List categories = [
      {"icon": "assets/images/categories/men.jpg", "text": "Men"},
      {"icon": "assets/images/categories/women.jpg", "text": "Women"},
      {"icon": "assets/images/categories/kids.jpg", "text": "Kids"},
      {"icon": "assets/images/categories/gift.png", "text": "Gifts"},
      {"icon": "assets/images/categories/kitchen.jpg", "text": "kitchen"},
      {"icon": "assets/images/categories/sports.jpg", "text": "Sports"},
      {"icon": "assets/images/categories/accessories.jpg", "text": "Accessories"},
      {"icon": "assets/images/categories/more.png", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            categories.length,
                (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {},
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        text=="More" ? Get.to(() =>  CategoryScreen())   :  Get.to(() =>  CategoryScreen());
        },
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(icon!),
            ),
            // Container(
            //   height: 55,
            //   width: 55,
            //   decoration: BoxDecoration(
            //     color: Color(0xFFFFECDF),
            //     // borderRadius: BorderRadius.circular(100),
            //     shape: BoxShape.circle,
            //   ),
            //   child: Image.asset(icon!,fit: BoxFit.cover),
            // ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List categories = ["Men", "Women", "Kids", "Gifts", "kitchen", "Sports", "Accessories", "Electronics",
    ];
    return Scaffold(
      appBar: appBarTheme("Categories"),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount:categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: InkWell(
                      onTap: (){
                      },
                      child: Container(
                          width: screenWidth * .14,
                          height: screenWidth * 0.35,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:Center(child: Text("${categories[index]}",style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w600,fontSize: 20,),))
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        )
      ),
    );
  }
}

