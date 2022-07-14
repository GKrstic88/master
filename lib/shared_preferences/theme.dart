import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeConductor extends StatefulWidget {
  const ThemeConductor({Key? key}) : super(key: key);

  @override
  State<ThemeConductor> createState() => _ThemeConductorState();
}

class _ThemeConductorState extends State<ThemeConductor> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool? _savedTheme;

  bool? get savedTheme => _savedTheme;

  @override
  void initState() {
    super.initState();
    _retrieveTheme();
  }

  Future<void> _retrieveTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('darkTheme')) {
      return;
    }
    setState(() {
      _savedTheme = prefs.getBool('darkTheme');
    });
  }

  Future<void> _saveTheme(bool switchTheme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkTheme', switchTheme);
  }

  Future<void> _clearTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('darkTheme')) {
      return;
    }
    await prefs.remove('darkTheme');
    setState(() {
      _savedTheme = null;
    });
  }

  @override
  Widget build(BuildContext context) {}
}
