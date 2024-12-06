import 'package:flutter/material.dart';
import 'package:newsapp1/remote/ApiManeger.dart';
import 'package:newsapp1/ui/CategoryDetail/widgets/ArticleItem.dart';
/*
class newsListWidget extends StatefulWidget {
  newsListWidget({super.key, required this.sourceID});
  final String sourceID;

  @override
  State<newsListWidget> createState() => _newsListWidgetState();
}

class _newsListWidgetState extends State<newsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Apimaneger.getAriticles(widget.sourceID) , 
      builder:(context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Try Again"))
            ],
          );
        }
        var response = snapshot.data;
        if (response?.status == "error") {
          return Column(
            children: [
              Text(response?.message ?? ""),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Try Again"))
            ],
          );
        }
        var articles = response.articles ?? [];
        return   ListView.separated(
      itemBuilder:(context, index) => ArticleItem(news: articles[index]) , 
      separatorBuilder:(context, index) =>  Divider(), 
      itemCount:articles.length);
      },);
  }
}
*/
class newsListWidget extends StatefulWidget {
  final String sourceID;
  final String? searchQuery;

  newsListWidget({super.key, required this.sourceID, this.searchQuery,});

  @override
  State<newsListWidget> createState() => _newsListWidgetState();
}

class _newsListWidgetState extends State<newsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Apimaneger.getAriticles(widget.sourceID , searches: widget.searchQuery),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Try Again"),
              ),
            ],
          );
        }
        var response = snapshot.data;
        if (response?.status == "error") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(response?.status ?? "Error"),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Try Again"),
              ),
            ],
          );
        }

        var articles = response?.articles ?? [];
        if (widget.searchQuery != null && widget.searchQuery!.isNotEmpty) {
          articles = articles
              .where((article) =>
                  article.title != null &&
                  article.title!.toLowerCase().contains(widget.searchQuery!.toLowerCase()))
              .toList();
        }
        if (articles.isEmpty) {
          return Center(child: Text("No articles available."));
        }

        return ListView.separated(
          itemBuilder: (context, index) => ArticleItem(news: articles[index]),
          separatorBuilder: (context, index) => Divider(),
          itemCount: articles.length,
        );
      },
    );
  }
}


 












    