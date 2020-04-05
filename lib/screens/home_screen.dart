import 'package:angkordev/config.dart';
import 'package:angkordev/widgets/global_drawer_widget.dart';
import 'package:angkordev/widgets/home_tabbar_view_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: Config.categories.length,
      initialIndex: 1,
      child: Scaffold(
        // To manage Scaffold appBar Property
        appBar: AppBar(
          title: Text('Angkor Dev'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: Config.categories.map((category) {
              return Tab(
                text: category.title + " " + category.articleCount.toString(),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: Config.categories.map((category) {
            return HomeTabBarViewWidget(category.title, id: 3);
          }).toList(),
        ),
        drawer: GlobalDrawerWidget(),
      ),
    );
  }
}
