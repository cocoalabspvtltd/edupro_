import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/domain/core/network/api_provider.dart';
import 'package:pgs_edupro/infrastructure/local_data_source/user.dart';
import 'package:pgs_edupro/infrastructure/remote_data/models/course/course_in_category_response.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentFormScreen extends StatefulWidget {
  final String orderid;
  final CourseList courseDetails;
  const PaymentFormScreen(
      {super.key, required this.orderid, required this.courseDetails});

  @override
  State<PaymentFormScreen> createState() => _PaymentFormScreenState();
}

class _PaymentFormScreenState extends State<PaymentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController coursetitile = TextEditingController();
  TextEditingController Course_Payment = TextEditingController();
  TextEditingController course_id = TextEditingController();
  TextEditingController orderId  = TextEditingController();
  TextEditingController amount  = TextEditingController();
  TextEditingController user_id = TextEditingController();
  TextEditingController currencyName  = TextEditingController();
  TextEditingController mid  = TextEditingController();
  TextEditingController enckey = TextEditingController();
  TextEditingController course_Payment = TextEditingController();
  TextEditingController meTransReqType= TextEditingController();

  ApiProvider? apiPayment;

  @override
  void initState() {
    super.initState();
    user_id.text = UserDetailsLocal.userId;
    orderId.text=widget.orderid;
    coursetitile.text = widget.courseDetails.title?? '';
    amount.text=widget.courseDetails.price?? '';
    mid.text="WL0000000065439";
    enckey.text="e1a1cf35429f651fc4ead3714b6203f5";
    currencyName.text="INR";
    course_Payment.text ="Register";
    meTransReqType.text="S";
    setState(() {});
  }
  // final String htmlcode = """
  //    <h1>H1 Title</h1>
  //    <h2>H2 Title</h2>
  //       <p>A paragraph with <strong>bold</strong> and <u>underline</u> text.</p>
  //       <ol>
  //         <li>List 1</li>
  //         <li>List 2<ul>
  //             <li>List 2.1 (nested)</li>
  //             <li>List 2.2</li>
  //            </ul>
  //         </li>
  //         <li>Three</li>
  //       </ol>
  //    <a href="https://www.hellohpc.cdom">Link to HelloHPC.com</a>
  //    <img src='https://www.hellohpc.com/wp-content/uploads/2020/05/flutter.png'/>
  //   """;
  String url = "https://pgsedu.com/standard/meTrnPay.php?therapist_id=value";
  Future payment() async {

    FormData formData = FormData.fromMap({
      "addField1":"Course_Payment",
      "addField2":UserDetailsLocal.userId,
      "amount": widget.courseDetails.price,
      "OrderId":widget.orderid,
      "addField" :widget.courseDetails.courseId,
      "currencyName": "INR",
      "meTransReqType": "S",
      "mid":"WL0000000065439",
      "enckey":"e1a1cf35429f651fc4ead3714b6203f5",

    });
print("->${formData.fields}");
    final response = await apiPayment?.getJsonInstance()
        .post("https://pgsedu.com/standard/meTrnPay.php", data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':"Bearer " + UserDetailsLocal.apiToken,
            }
        )

    );
    print("->>>>>>>>>>>${response}");
    return response;

  }
  Widget build(BuildContext context) {
    print("orderid====>${widget.orderid}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Payment",
          style: appBarText,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  thickSpace,
                  thickSpace,
                  thickSpace,
                  // Html(
                  //   data: htmlcode,
                  //   tagsList: Html.tags,
                  //   style: {
                  //     "table": Style(
                  //       backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                  //     ),
                  //     "tr": Style(
                  //       border: Border(bottom: BorderSide(color: Colors.grey)),
                  //     ),
                  //     "th": Style(
                  //       padding: EdgeInsets.all(6),
                  //       backgroundColor: Colors.grey,
                  //     ),
                  //     "td": Style(
                  //       padding: EdgeInsets.all(6),
                  //       alignment: Alignment.topLeft,
                  //     ),
                  //     'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                  //   },
                  // ),
                  Card(
                    elevation: 20,
                    shadowColor: Colors.black,
                    color: primaryColor[100],
                    child: SizedBox(
                      width: 300,
                      height: 420,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 80,
                              child:  CircleAvatar(
                                backgroundImage: NetworkImage(
                                    UserDetailsLocal.storageBaseUrl +
                                        (widget.courseDetails.courseThumbnail?? '')), //NetworkImage
                                radius: 100,
                              ), //CircleAvatar
                            ), //CircleAvatar
                             SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              enabled:false ,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),),
                              controller: coursetitile,
                              keyboardType: TextInputType.text,
                            ),
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center ,
                              children: [
                                Text("Amount : "),
                                SizedBox(
                                  width: 70,
                                  child: TextFormField(
                                    enabled:false ,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.all(10),),
                                    controller: amount,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: false,
                              child: TextFormField(
                                controller:orderId ,
                                enabled: false,
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: TextFormField(
                                controller:user_id ,
                                enabled: false,
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: TextFormField(
                                controller:course_id ,
                                enabled: false,
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: TextFormField(
                                controller:mid ,
                                enabled: false,
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: TextFormField(
                                controller:currencyName,
                                enabled: false,
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: TextFormField(
                                controller:enckey,
                                enabled: false,
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: TextFormField(
                                controller:enckey,
                                enabled: false,
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: TextFormField(
                                controller:course_Payment ,
                                enabled: false,
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: TextFormField(
                                controller: meTransReqType,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ), //SizedBox
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: (){
                                  launch(url);
                                  // launch("https://pgsedu.com/standard/meTrnPay.php",headers: {
                                  //   "addField1":"Course_Payment",
                                  //   "addField2":UserDetailsLocal.userId,
                                  //   "amount": "1222",
                                  //   "OrderId":widget.orderid,
                                  //   "addField" :"131",
                                  //   "currencyName": "INR",
                                  //   "meTransReqType": "S",
                                  //   "mid":"WL0000000065439",
                                  //   "enckey":"e1a1cf35429f651fc4ead3714b6203f5",
                                  // });

                                  // payment();
                                } ,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text('Check out'),
                                ),
                              ),
                            ) //SizedBox
                          ],
                        ), //Column
                      ), //Padding
                    ), //SizedBox
                  ), //Card
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
