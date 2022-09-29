import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference/models/loading_screen.dart';
import 'package:shared_preference/models/settings.dart';
import 'package:shared_preference/pages/loading_view.dart';
import 'package:shared_preference/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeSettings(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoadScreen(),
        ),
      ],
      child: Consumer<LoadScreen>(
        builder: (context, value, child) {
          return value.doneLoading
              ? Consumer<ThemeSettings>(
                  builder: (context, value, child) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: value.darkTheme ? darkTheme : lightTheme,
                      home: const MyHomePage(),
                    );
                  },
                )
              : LoadingView(context: context);
        },
      ),
    );
  }
}
