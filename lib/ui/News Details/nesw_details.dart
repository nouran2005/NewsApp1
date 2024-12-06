import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/models/articleResponse/Article.dart';
import 'package:newsapp1/style/AppColors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class newsDetails extends StatelessWidget {
  const newsDetails({super.key, required this.news});
  static const String routeName = "details";
  final Article news;
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
        appBar: AppBar(
          title: Text(news.source?.name ?? "News Details"),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
        imageUrl: news.urlToImage ?? "" ,
        height: 234.h, 
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error , color: Theme.of(context).colorScheme.primary,size: 40.sp,),
     ),
            SizedBox(height: 10.h),
            Text(
          news.source?.name?? "",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
            Text(
              news.title ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Align(
          alignment: Alignment.centerRight,
          child: Text(
            timeago.format(DateTime.parse(news.publishedAt??"")),
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
              SizedBox(height: 35.h),

            SingleChildScrollView(
              child: Container(
                padding: REdgeInsets.all(10),
                decoration: BoxDecoration(
              color: AppColors.descriptionBackground,
              borderRadius:BorderRadius.all(Radius.circular(5.r)),
                ),
                child: Text(
                  news.description ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            
            const Spacer(),
            Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton.icon(
                  onPressed: ()=> _launchURL(context, news.url, true),
                  icon: const Icon(Icons.open_in_new),
                  label: Text(
                    "Read Full Article",
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    padding: REdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
      );
    
  }
}
Future<void> _launchURL(BuildContext context, String? url, bool inapp) async {
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await inapp? launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)
                 : launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unable to open the article.")),
      );
    }}

