import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/src/core/constants/q_colors.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<Map<String, dynamic>> items = [
    {'title': 'Learn programming by 12am', 'isChecked': false},
    {'title': 'Learn how to cook by 1pm', 'isChecked': false},
    {'title': 'Pick up the kids by 2pm', 'isChecked': false},
    {'title': 'Have lunch at 3pm', 'isChecked': false},
    {'title': 'Go visit mum by4pm', 'isChecked': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: QColors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Daily Task?",
                  style: TextStyle(
                    color: QColors.grey_100,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    icon: const Icon(Icons.add_circle_outline_sharp, size: 25))
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsetsDirectional.zero,
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  leading: Checkbox(
                    checkColor: Theme.of(context).primaryColor,
                    activeColor: Theme.of(context).primaryColor,
                    value: items[index]['isChecked'],
                    onChanged: (bool? value) {
                      setState(() {
                        items[index]['isChecked'] = value!;
                      });
                    },
                  ),
                  title: Text(items[index]['title']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
