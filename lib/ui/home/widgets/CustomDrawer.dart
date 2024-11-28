import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/main.dart';
import 'package:newsapp1/ui/home/widgets/DrawerItem.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: REdgeInsets.symmetric(
              vertical: 55
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text("News App", style: Theme.of(context).textTheme.headlineMedium,),
          ),
          SizedBox(height: 29.h,),
          DrawerItem(
            icon: Icons.list,
            title: "Categories",
            ontap: (){},
          ),
          SizedBox(height: 25.h,),
          DrawerItem(
            icon: Icons.settings,
            title: "Settings",
            ontap: (){},
          ),
      ],
    );
  }
}