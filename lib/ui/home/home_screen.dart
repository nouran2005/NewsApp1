import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newsapp1/ui/CategoryDetail/widgets/CategoryDetailWidget.dart';
import 'package:newsapp1/ui/home/widgets/Categories_Tabs.dart';
import 'package:newsapp1/ui/home/widgets/Setteing_Tab.dart';
import 'package:newsapp1/ui/home/widgets/customDrawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key,});
  static const String routeName = "home";

  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTab(onTap: selectNewCategory,);
  }

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
        drawer: Drawer(child: CustomDrawer(onpress: onSelectedTab,),),
        appBar: AppBar(
          title: Text(
            "News App",
            ),
          
        ),
        body: selectedWidget,
      ),
    );
  }
  void onSelectedTab(Tabenum tab) {
    
      switch (tab) {
        case Tabenum.Categories:
          selectedWidget = CategoriesTab(onTap: selectNewCategory,);
          break;
        case Tabenum.Settings:
          selectedWidget = SetteingTab(); 
          break;
      }
      setState(() {
    },
    );
    Navigator.pop(context);
}
  selectNewCategory(String ID){
    selectedWidget = Categorydetailwidget(categoryID: ID,);
    setState(() {
      
    });
  }
}