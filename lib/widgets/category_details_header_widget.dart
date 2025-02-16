import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryDetailsHeaderWidget extends StatelessWidget {
  final String categoryName;
  final IconData itemCurso;
  final String topicCategory;

  const CategoryDetailsHeaderWidget(
      {Key? key,
      required this.categoryName,
      required this.itemCurso,
      required this.topicCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            height: 202,
            // alignment: Alignment.center,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesomeIcons.searchengin)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesomeIcons.bell)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesomeIcons.heart)),
                          ],
                        )
                      ],
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 20),
                      child: Row(
                        children: [
                          // Icon(itemCurso),
                          Text(
                            topicCategory + ' - ' + categoryName,
                            // '$categoryName' + ' $itemCurso',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
