import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

import 'task_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    final tkListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      //would see error here if "preferred sized widget type isn't used in appbar"
      child: TaskList(
        userTasks,
      ),
      //Change userTasks from a global var in bottomnav and add getter
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          'My Tasks',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          tkListWidget,
        ],
      ),
    );
  }
}
