import 'package:flutter/material.dart';
import 'package:pgs_edupro/domain/core/constants.dart';

class InstructorsListScreen extends StatefulWidget {
  const InstructorsListScreen({Key? key}) : super(key: key);

  @override
  State<InstructorsListScreen> createState() => _InstructorsListScreenState();
}

class _InstructorsListScreenState extends State<InstructorsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Instructors",
            style: boldValuePrimaryColor,
          ),
        ),
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        elevation: 1,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(7))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: ListTile(
                            // selected: selectedIndex == index ? true : false,
                            isThreeLine: true,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name :  ',
                                    style: TextStyle(fontSize: 18,
                                        color:
                                        Colors.black
                                    )),
                                const SizedBox(height: 5,),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Courses : ',
                                  style: TextStyle(
                                    fontSize: 18, color: Colors.black,),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor:Colors.pink[300],
                                      child: IconButton(
                                        onPressed: () {
                                        },
                                        icon: const Icon(Icons.edit,
                                          color: Colors.white, size: 15,),
                                      ),
                                    ),
                                    const SizedBox(width: 7,),
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Colors.blueAccent,
                                      child: IconButton(
                                        onPressed: () {

                                        },
                                        icon: const Icon(Icons.remove_red_eye,
                                          color: Colors.white, size: 15,),
                                      ),
                                    ),
                                    const SizedBox(width: 7,),
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Colors.red,
                                      child: IconButton(
                                        onPressed: () {

                                        },
                                        icon: const Icon(Icons.delete,
                                          color: Colors.white, size: 15,),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),));
                  },
                ),
              ],
            ),
          ),
        ));;
  }
}
