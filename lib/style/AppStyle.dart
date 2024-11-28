import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/style/AppColors.dart';

class AppStyle {
  static ThemeData  lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightPrimaryColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 27.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.r),
            bottomRight: Radius.circular(50.r)
          )
        ),
        titleTextStyle: TextStyle(
          fontFamily: "Exo",
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 22.sp,
        )
      ),
      colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimaryColor,
      primary: AppColors.lightPrimaryColor,
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.greyColor,
        )
      )
      
  );
}