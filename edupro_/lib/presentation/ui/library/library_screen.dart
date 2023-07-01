import 'package:flutter/material.dart';
import 'package:pgs_edupro/domain/core/constants.dart';

class LibraryScreen extends StatefulWidget {
  final bool isFromMainScreen;
  const LibraryScreen({
    super.key,
    this.isFromMainScreen = true,
  });

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  // Initial Selected Value
  String dropdownvalueDifficultyLevel = 'None';

  // List of items in our dropdown menu
  var difficultyLevels = [
    'None',
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  String dropdownvalueSubject = 'None';

  // List of items in our dropdown menu
  var subjects = [
    'None',
    'Physics',
    'Chemistry',
    'Biology',
    'Computer Science',
    'Commerce',
    'Humanities'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isFromMainScreen
          ? null
          : AppBar(
              title: const Text('Library'),
            ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Filter by"),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Difficulty level",
                                    style: boldValue,
                                  ),
                                  DropdownButton(
                                    // Initial Value
                                    value: dropdownvalueDifficultyLevel,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: difficultyLevels.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalueDifficultyLevel =
                                            newValue!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subject",
                                    style: boldValue,
                                  ),
                                  DropdownButton(
                                    // Initial Value
                                    value: dropdownvalueSubject,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: subjects.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalueDifficultyLevel =
                                            newValue!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              color: Colors.green,
                              padding: const EdgeInsets.all(14),
                              child: const Text("okay"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Icon(Icons.sort),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thickSpace,
                  Text(
                    ' Recent & Bookmarks',
                    style: boldWord,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth / 2 - 8,
                          height: screenWidth / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "session to show most recent learning materials that user has accessed",
                                textAlign: TextAlign.justify,
                                style: boldValuePrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth / 2 - 8,
                          height: screenWidth / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "session to show most recent learning materials that user has accessed",
                                textAlign: TextAlign.justify,
                                style: boldValuePrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  thickSpace,
                  Text(
                    ' Categories',
                    style: boldWord,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth / 2 - 8,
                          height: screenWidth / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "session to show categories for available learning materials such as subject, topic, level or type of content",
                                textAlign: TextAlign.justify,
                                style: boldValuePrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth / 2 - 8,
                          height: screenWidth / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ssession to show categories for available learning materials such as subject, topic, level or type of content",
                                textAlign: TextAlign.justify,
                                style: boldValuePrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  thickSpace,
                  Text(
                    ' Recommended',
                    style: boldWord,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth / 2 - 8,
                          height: screenWidth / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "session to show personalized recommendations based on user interests,  preferences and learning history",
                                textAlign: TextAlign.justify,
                                style: boldValuePrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth / 2 - 8,
                          height: screenWidth / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "session to show personalized recommendations based on user interests,  preferences and learning history",
                                textAlign: TextAlign.justify,
                                style: boldValuePrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  thickSpace,
                  Text(
                    ' Downloadable Resources',
                    style: boldWord,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth / 2 - 8,
                          height: screenWidth / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "session to show downloadable learning materials for offline use",
                                textAlign: TextAlign.justify,
                                style: boldValuePrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth / 2 - 8,
                          height: screenWidth / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "session to show downloadable learning materials for offline use",
                                textAlign: TextAlign.justify,
                                style: boldValuePrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
