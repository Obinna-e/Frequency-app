import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _beDark = false;
  bool _hideNotifs = false;
  bool _autoUpdate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Card(
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Use Dark Theme'),
                Switch(
                    value: _beDark,
                    onChanged: (val) {
                      setState(() {
                        _beDark = val;
                      });
                    })
              ],
            ),
          ),
          Card(
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications'),
                Switch(
                    value: _hideNotifs,
                    onChanged: (val) {
                      setState(() {
                        _hideNotifs = val;
                      });
                    })
              ],
            ),
          ),
          Card(
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Automatic Updates'),
                Switch(
                    value: _autoUpdate,
                    onChanged: (val) {
                      setState(() {
                        _autoUpdate = val;
                      });
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
