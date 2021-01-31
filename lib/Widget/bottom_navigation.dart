import 'package:flutter/material.dart';

import 'package:frequency/Widget/calendar_screen.dart';
import 'package:frequency/Widget/home_screen.dart';
import 'package:frequency/Widget/settings.dart';
import 'package:frequency/models/tasks.dart';
import 'package:frequency/Widget/new_task.dart';

import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

final List<Task> userTasks = [];

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void _addNewTask(String tkTitle, DateTime chosenTime) {
    final newtk =
        Task(id: DateTime.now().toString(), title: tkTitle, date: chosenTime);
    setState(() {
      userTasks.add(newtk);
    });
  }

  void _startAddNewTask(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTask(_addNewTask),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  ShapeBorder bottomBarShape = const BeveledRectangleBorder(
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(8),
    topRight: Radius.circular(8),
  ));
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(0);

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.indicator;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.blueGrey;
  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);

  Color unselectedColor = Colors.blueGrey;
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: <Widget>[
            Center(
              child: HomeScreen(),
            ),
            Center(
              child: CalendarScreen(),
            ),
            Center(
              child: Text('Notifications'),
            ),
            Center(
              child: SettingsScreen(),
            ),
          ],

          //physics: NeverScrollableScrollPhysics(),
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,
        elevation: 20,
        snakeViewColor: Colors.deepPurple[100],
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.blueGrey,
        showSelectedLabels: showSelectedLabels,
        showUnselectedLabels: showUnselectedLabels,
        currentIndex: _selectedItemPosition,
        onTap: _onTappedBar,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: ('Calendar'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _startAddNewTask(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedItemPosition = index;
    });
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedItemPosition = value;
    });
    _pageController.jumpToPage(value);
  }
}
//fix slide without snake moving
