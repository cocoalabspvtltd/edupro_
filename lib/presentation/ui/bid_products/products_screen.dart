import 'package:flutter/material.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/closed_product_list.dart';
import 'package:pgs_edupro/presentation/ui/bid_products/live_product_list.dart';

import 'upcoming_product_list.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(

          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xFFB226B2),
                      Colors.orange]),
              ),
            ),
            title: Text("Products"),
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.deepPurple),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                         ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Live"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Upcoming"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                         ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Closed"),
                      ),
                    ),
                  ),
                ]),
          ),
          body: Container(decoration: BoxDecoration(  gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xFFB226B2),
                Colors.orange]),),
            child: TabBarView(children: [
              LiveProductlistScreen(),
              UpcomigProductlistScreen(),
              ClosedProductlistScreen()
            ]),
          ),
        ));
  }
}
