/*import 'package:flutter/material.dart';
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
  String appBarTitle = "News App";
  bool searchIcon = false;
  bool isSearching = false;
  late TextEditingController SearchController;
  String searchQuery = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SearchController = TextEditingController();
    selectedWidget = CategoriesTab(onTap: selectNewCategory,);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SearchController.dispose();
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
        appBar:AppBar(
          title: isSearching
              ? TextField(
                  controller: SearchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Search..." ,
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  style: Theme.of(context).textTheme.headlineSmall,
                  onChanged: (value) {
                    
                  },
                )
              : Text(appBarTitle),
          actions: searchIcon
              ? [
                  isSearching
                      ? IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              isSearching = false;
                              SearchController.clear();
                              
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              isSearching = true;
                            });
                          },
                        ),
                ]
              : null,
        ),
        body: selectedWidget,
      ),
    );
  }
  void onSelectedTab(Tabenum tab) {
    
      switch (tab) {
        case Tabenum.Categories:
          selectedWidget = CategoriesTab(onTap: selectNewCategory,);
          appBarTitle = "News App";
          searchIcon = false;
          isSearching = false;
          break;
        case Tabenum.Settings:
          selectedWidget = SetteingTab(); 
          appBarTitle = "Settings";
          searchIcon = false;
          isSearching = false;
          break;
      }
      setState(() {
    },
    );
    Navigator.pop(context);
}
  selectNewCategory(String ID,String categoryTitle){
    selectedWidget = Categorydetailwidget(categoryID: ID , );
    appBarTitle = categoryTitle;
    searchIcon = true;
    isSearching = false;
    setState(() {
    
      
    });

  }
}
*/

import 'package:flutter/material.dart';
import 'package:newsapp1/ui/CategoryDetail/widgets/CategoryDetailWidget.dart';
import 'package:newsapp1/ui/home/widgets/Categories_Tabs.dart';
import 'package:newsapp1/ui/home/widgets/Setteing_Tab.dart';
import 'package:newsapp1/ui/home/widgets/customDrawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;
  String appBarTitle = "News App";
  bool searchIcon = false;
  bool isSearching = false;
  late TextEditingController SearchController;
  String? searchQuery;

  @override
  void initState() {
    super.initState();
    SearchController = TextEditingController();
    selectedWidget = CategoriesTab(onTap: selectNewCategory);
    
  }

  @override
void dispose() {
  SearchController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        drawer: Drawer(child: CustomDrawer(onpress: onSelectedTab)),
        appBar: AppBar(
          title: isSearching
              ? TextField(
                  controller: SearchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  style: Theme.of(context).textTheme.headlineSmall,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                )
              : Text(appBarTitle),
          actions: searchIcon
              ? [
                  isSearching
                      ? IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              isSearching = false;
                              SearchController.clear();
                              searchQuery = ""; 
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              isSearching = true;
                            });
                          },
                        ),
                ]
              : null,
        ),
        body: selectedWidget,
      ),
    );
  }

  void onSelectedTab(Tabenum tab) {
    switch (tab) {
      case Tabenum.Categories:
        selectedWidget = CategoriesTab(onTap: selectNewCategory);
        appBarTitle = "News App";
        searchIcon = false;
        isSearching = false;
        break;
      case Tabenum.Settings:
        selectedWidget = SetteingTab();
        appBarTitle = "Settings";
        searchIcon = false;
        isSearching = false;
        break;
    }
    setState(() {});
    Navigator.pop(context);
  }

  void selectNewCategory(String ID, String categoryTitle) {
    selectedWidget = Categorydetailwidget(
      categoryID: ID,
      searchQuery: searchQuery,
    );
    appBarTitle = categoryTitle;
    searchIcon = true;
    isSearching = false;
    setState(() {});
  }

}

