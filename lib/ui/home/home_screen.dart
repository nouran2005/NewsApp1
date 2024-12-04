import 'package:flutter/material.dart';
import 'package:newsapp1/ui/home/widgets/Categories_Tabs.dart';
import 'package:newsapp1/ui/home/widgets/customDrawer.dart';
typedef selectab = void Function();
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = "home";
  Widget selectedwidget = CategoriesTab();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.fill
          ),
      ),
      child: Scaffold(
        drawer: Drawer(child: CustomDrawer(),),
        appBar: AppBar(
          title: Text(
            "News App",
            ),
          
        ),
        body: selectedwidget,
      ),
    );
  }
}