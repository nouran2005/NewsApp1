import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/remote/ApiManeger.dart';
import 'package:newsapp1/style/AppColors.dart';
import 'package:newsapp1/ui/CategoryDetail/widgets/ArticleItem.dart';

class NewsSearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightPrimaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.r),
            bottomRight: Radius.circular(50.r),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(
          color: AppColors.descriptionColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close, color: Colors.white),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back, color: Colors.white),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? _buildSearchPrompt()
        : _buildSearchResults();
  }







  Widget _buildSearchPrompt() {
    return Container(
      decoration: _backgroundDecoration(),
      child: Center(
        child: Text(
          "Search for articles...",
          style: TextStyle(color: AppColors.descriptionColor, fontSize: 18.sp),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Container(
      decoration: _backgroundDecoration(),
      child: FutureBuilder(
        future: Apimaneger.searchArticles(searches: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.lightPrimaryColor),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error, color: AppColors.lightPrimaryColor, size: 50),
                  SizedBox(height: 10.h),
                  Text("Something went wrong. Please try again."),
                ],
              ),
            );
          }

          var response = snapshot.data;
          if (response == null || response.status == "error") {
            return Center(
              child: Text(response?.message ?? "An error occurred."),
            );
          }

          var articles = response.articles ?? [];
          if (articles.isEmpty) {
            return Center(
              child: Text("No articles match your search."),
            );
          }

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) => ArticleItem(news: articles[index]),
          );
        },
      ),
    );
  }

  BoxDecoration _backgroundDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/pattern.png"),
        fit: BoxFit.fill,
      ),
    );
  }
}
