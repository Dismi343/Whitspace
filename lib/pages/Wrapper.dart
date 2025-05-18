import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whitespace/models/UserModel.dart';
import 'package:whitespace/pages/home_page.dart';
import 'package:whitespace/pages/start_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return StartPage();
    } else {
      return HomePage();
    }
  }
}
