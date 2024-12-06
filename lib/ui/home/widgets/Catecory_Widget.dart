import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/models/Category.dart';

class CatecoryWidget extends StatelessWidget {
  const CatecoryWidget({super.key, required this.categoryModel, required this.index, required this.onTap});
  final CategoryModel categoryModel ;
  final int index ;
  final void Function(String, String) onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onTap(categoryModel.id, categoryModel.title);},
      child: Container(
        padding: EdgeInsets.all(8),
        decoration:BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(index.isEven?24:0),
            bottomRight: Radius.circular(index.isEven?0:24)
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/${categoryModel.imagePath}",
              height: 100.h,
              width: 116.w,
              
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              categoryModel.title,
              style:Theme.of(context).appBarTheme.titleTextStyle
            )
          ],
        ),
      ),
    );
  }
}