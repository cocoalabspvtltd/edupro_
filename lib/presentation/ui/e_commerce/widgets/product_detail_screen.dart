import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'button.dart';
import 'count_controller.dart';
import 'package:badges/badges.dart'as badge;

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  int pageIndex=0;
  List<Widget> _demo=[
    Container(height: 300,color: Colors.white,child: Image.asset("assets/images/home/headphone1.jpg")),
    Container(height: 300,color: Colors.white,child: Image.asset("assets/images/home/headphone2.jpg")),
    Container(height: 300,color: Colors.white,child: Image.asset("assets/images/home/headphone3.jpg")),
    Container(height: 300,color: Colors.white,child: Image.asset("assets/images/home/headphone4.jpg")),
  ];
  int? countControllerValue;
  Widget build(BuildContext context) {
    return Scaffold(
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
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color:Colors.black,
              size: 24,
            ),
          ),
          title: Text(
            'Product Name',
            style:TextStyle(
              fontFamily: 'Pacifico',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
        Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 24, 0),
      child: badge.Badge(
        badgeContent: Text(
          '0',
          style:TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        showBadge: true,

        child: IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            },
        ),
      ),
    )
          ],

          centerTitle: true,
          elevation: 0,

        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,

                      width: double.infinity-0.6,
                      child: PageView(
                        children: _demo,

                        onPageChanged: (index){
                          setState(() {
                            pageIndex=index;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 40,),
                    CarouselIndicator(
                      count: _demo.length,
                      index: pageIndex,
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Text(
                        'Detailed Product',
                        style: TextStyle(fontFamily: "Pacifico"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                      child: Text(
                        '₹ 3000',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontFamily: "Sigmar"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                      child:

                      AutoSizeText(
                        'Lorem ipsum dolor sit amet, consecteturegfdrgergersgtfersdfgdsgvdgvsdfgttredtrefgdfg adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
                        style: TextStyle(fontFamily: "Sigmar"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xFFB226B2),
    Colors.orange]),
                 // color: Colors.deepOrange,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x320F1113),
                      offset: Offset(0, -2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 26, 16, 34),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.orangeAccent,
                            width: 2,
                          ),
                        ),
                            child: CountController(
                             decrementIconBuilder: (enabled) => Icon(
                              Icons.remove_rounded,
                           color: enabled ? Colors.white : Colors.white,
                                        size: 16,
                                                          ),
                                       incrementIconBuilder: (enabled) => Icon(
             Icons.add_rounded,
    color: enabled ? Colors.white :Colors.white,
    size: 16,
    ),
    countBuilder: (count) => Text(
    count.toString(),

    ),
    count: countControllerValue ??= 1,
    updateCount: (count) => setState(() => countControllerValue = count),
    stepSize: 1,
    minimum: 1,
    ),

    ),

                      MyButtonWidget(
                        onPressed: () {
                          // Product p = widget.product;
                          // p.quantity = countControllerValue!.toInt();
                          // BlocProvider.of<CartBloc>(context).add(AddProduct(p));
                        },
                        text: 'Add to Cart',
                        options: const ButtonOptions(
                            width: 160,
                            height: 50,
                            color:Colors.black,
                            textStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            elevation: 5,
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(36))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
