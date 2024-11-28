import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/models/Category.dart';
import 'package:newsapp1/ui/home/widgets/Catecory_Widget.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 35 , vertical: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category \nof interest', style:Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 29.h,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25.w,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 1/1.2,
                    ), 
              itemBuilder: (context, index) =>CatecoryWidget(
                categoryModel: CategoryModel.AllCategories[index], 
                index: index) ,
              itemCount: CategoryModel.AllCategories.length,
              ),
          ),
        ],
      ),
    );
  }
}