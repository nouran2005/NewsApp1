import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/ui/CategoryDetail/NewsListWidget.dart';

class Categorydetailwidget extends StatelessWidget {
  const Categorydetailwidget({super.key, required this.categoryID});
  final String categoryID;
  static const List<String> sources =[
    "BBC news", "CBC news", "Sport news", "ABC news"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Padding(
        padding: REdgeInsets.all(10),
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              dividerHeight: 0,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Theme.of(context).colorScheme.primary,
              labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                
              tabs: sources.map((e) => Container(
                margin: REdgeInsets.symmetric(horizontal: 10),
                  padding: REdgeInsets.symmetric(
                    vertical: 1 ,
                    horizontal: 16,
                  ),
                  decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  )
                ) ,
                  child: Tab(child: Text(e)),
              )).toList()
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: TabBarView(
                  children: sources.map((e) => newsListWidget()).toList()
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
