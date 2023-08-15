import 'package:flutter/material.dart';

import '../../feature/clone/screens/page_controller.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Instagram Clone",
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const ControllerPage(),
      ),
    );
  }
}
