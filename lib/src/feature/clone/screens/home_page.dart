import 'package:flutter/material.dart';

import '../../../common/constants/icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 104,
          height: 30,
          child: Image(
            image: AssetImage(AppIcons.icInstagram),
          ),
        ),
      ),
    );
  }
}
