import 'package:flutter/material.dart';




class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List categories = [
      {"icon": "assets/icons/profile_icons/person.png", "text": "Men"},
      {"icon": "assets/icons/profile_icons/person.png", "text": "Women"},
      {"icon": "assets/icons/profile_icons/person.png", "text": "Kids"},
      {"icon": "assets/icons/profile_icons/person.png", "text": "Gifts"},
      {"icon": "assets/icons/profile_icons/person.png", "text": "kitchen"},
      {"icon": "assets/icons/profile_icons/person.png", "text": "Sports"},
      {"icon": "assets/icons/profile_icons/person.png", "text": "Accesories"},
      {"icon": "assets/icons/profile_icons/person.png", "text": "Electronics"},
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
      onTap: press,
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
