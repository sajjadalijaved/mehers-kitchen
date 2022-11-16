import 'package:flutter/material.dart';
import 'package:mehers_kitchen/drawer/global_drawer_page.dart';
import 'package:mehers_kitchen/widgets/home_screen_page.dart';
import 'package:mehers_kitchen/widgets/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String pageName = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: const GlobalDrawer(),
            backgroundColor: const Color(0Xff62554c),
            body: LayoutBuilder(
              builder: (context, constraints) {
                double height = constraints.maxHeight;

                return Column(
                  children: [
                    SizedBox(
                        height: height * 0.35,
                        child: HomeScreenCategoryLoadedUI()),
                    SizedBox(height: height * 0.65, child: const ShowScreen())
                  ],
                );
              },
            )));
  }
}
