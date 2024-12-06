import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/style/AppStyle.dart';
import 'package:newsapp1/ui/home/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppStyle.lightTheme,
          themeMode: ThemeMode.light,
          routes: {
        HomeScreen.routeName :(_)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
