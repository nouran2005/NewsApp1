import 'package:flutter/material.dart';
import 'package:newsapp1/models/ArticleModel.dart';
import 'package:newsapp1/ui/CategoryDetail/widgets/ArticleItem.dart';

class newsListWidget extends StatelessWidget {
  newsListWidget({super.key});
  static List<ArticleModel> articles = [
    ArticleModel(
      image: "https://st4.depositphotos.com/4231139/23240/i/450/depositphotos_232401798-stock-photo-sunset-and-big-old-tree.jpg",
      title: "Why are football's biggest clubs starting a new tournament?",
      date: DateTime.now(),
      source: "BBC News"
    ),
    ArticleModel(
      image: "https://st4.depositphotos.com/4231139/23240/i/450/depositphotos_232401798-stock-photo-sunset-and-big-old-tree.jpg",
      title: "Why are football's biggest clubs starting a new tournament?",
      date: DateTime.now(),
      source: "BBC News"
    ),
    ArticleModel(
      image: "https://st4.depositphotos.com/4231139/23240/i/450/depositphotos_232401798-stock-photo-sunset-and-big-old-tree.jpg",
      title: "Why are football's biggest clubs starting a new tournament?",
      date: DateTime.now().subtract(Duration(hours: 5)),
      source: "BBC News"
    ),
    ArticleModel(
      image: "https://st4.depositphotos.com/4231139/23240/i/450/depositphotos_232401798-stock-photo-sunset-and-big-old-tree.jpg",
      title: "Why are football's biggest clubs starting a new tournament?",
      date: DateTime.now().subtract(Duration(days: 5)),
      source: "BBC News"
    ),
    
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:(context, index) => ArticleItem(news: articles[index]) , 
      separatorBuilder:(context, index) =>  Divider(), 
      itemCount: articles.length);
  }
}