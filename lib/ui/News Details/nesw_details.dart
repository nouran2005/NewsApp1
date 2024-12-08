import 'package:flutter/material.dart';
import 'package:newsapp1/models/articleResponse/Article.dart';
import 'package:newsapp1/ui/News%20Details/widgets/detailsWidget.dart';

class newsDetails extends StatelessWidget {
  const newsDetails({super.key, required this.news});
  static const String routeName = "details";
  final Article news;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        color:  Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.fill
          ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Details"),
        ),
        body: detailsWidget(news: news,),
    ),
      );
    
  }
}



