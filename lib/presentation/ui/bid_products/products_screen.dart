import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pgs_edupro/domain/core/constants.dart';

class ProductsScreen extends StatefulWidget {
  final int fragmentToShow;
  const ProductsScreen({super.key, required this.fragmentToShow});
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with SingleTickerProviderStateMixin {
  var selectedTabPos = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    selectedTabPos = widget.fragmentToShow != null ? widget.fragmentToShow : 0;
    _tabController.animateTo(selectedTabPos);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar:appBarTheme("Products"),
          body: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                constraints: BoxConstraints.expand(height: 55),
                child: BottomAppBar(
                  child: infoTabs(),
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: getSubFragment(selectedTabPos),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _backPressFunction() {
    print("_sendOtpFunction clicked");
    Get.back();
  }

  Future<bool> onWillPop() {
    return Future.value(true);
  }

  infoTabs() {
    return TabBar(
      controller: _tabController,
      onTap: tabItemClicked,
      tabs: [
        Tab(
          child: tabItem(context, 'How to Start'),
        ),
        Tab(
          child: tabItem(context, 'Steps'),
        ),
        Tab(
          child: tabItem(context, 'How It'),
        )
      ],
      labelColor: Colors.black,
      unselectedLabelColor: Colors.green,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.red,
      indicatorWeight: 3,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.red, width: 2.0),
        insets: getIndicatorPadding(),
      ),
    );
  }

  getIndicatorPadding() {
    if (selectedTabPos == 0) {
      return EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 2.0);
    } else {
      return EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 2.0);
    }
  }

  Row tabItem(BuildContext context, var title) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
            flex: 2,
          ),
        ]);
  }

  /*
    While clicking a tab item
   */
  void tabItemClicked(int index) {
    if (mounted) {
      setState(() {
        selectedTabPos = index;
      });
    }
  }

  getSubFragment(int pos) {
    switch (pos) {
      case 0:
        return Text("nknlkl");
        break;
      case 1:
        return Text("kllnl");
        break;
      case 2:
        return Text("bjkn");
        break;

      default:
        return new Center(
          child: Text("Error"),
        );
    }
  }
}
