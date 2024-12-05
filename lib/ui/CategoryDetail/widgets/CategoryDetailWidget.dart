import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/models/sourceResponse/Source.dart';
import 'package:newsapp1/remote/ApiManeger.dart';
import 'package:newsapp1/ui/CategoryDetail/NewsListWidget.dart';

class Categorydetailwidget extends StatefulWidget {
  const Categorydetailwidget({super.key, required this.categoryID});
  final String categoryID;
  /*static const List<String> sources =[
    "BBC news", "CBC news", "Sport news", "ABC news"
  ];*/

  @override
  State<Categorydetailwidget> createState() => _CategorydetailwidgetState();
}

class _CategorydetailwidgetState extends State<Categorydetailwidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Apimaneger.getSources(widget.categoryID),
      builder: (context, snapshot) {
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
        return DefaultTabController(
          length: response?.sources?.length ?? 0,
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
                  tabs: response?.sources
                          ?.map<Widget>((source) => Container(
                                margin: REdgeInsets.symmetric(horizontal: 10),
                                padding: REdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                child: Tab(child: Text(source.name ?? "")),
                              ))
                          .toList() ??
                      [],
                ),
                SizedBox(
                    height: 10.h), 
                Expanded(
                  child: TabBarView(
                    children: response?.sources
                            ?.map((Source) => newsListWidget(sourceID: Source.id ?? "",))
                            .toList() ??
                        [],
                  ),
                ),
              ],
            ),
          ),
        );
        ;
      },
    );
  }
}
