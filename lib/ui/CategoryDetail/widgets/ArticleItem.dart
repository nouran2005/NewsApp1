import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/models/ArticleModel.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.news});
   final ArticleModel news;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
        imageUrl: news.image ,
        height: 234.h, 
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error , color: Theme.of(context).colorScheme.primary,size: 40.sp,),
     ),
        SizedBox(height: 10.h,),
        Text(
          news.source?? "",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Text(
          news.title ?? "",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            timeago.format(news.date),
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    );
  }
}